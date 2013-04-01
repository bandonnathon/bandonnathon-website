require 'rubygems'
require 'bundler/setup'

require 'uglifier'

require 'sinatra/base'
require 'sinatra/assetpack'
require "sinatra/reloader"

require 'sinatra/backbone'

require 'mongo'

require 'open-uri'
require 'json'

# for fb connect
require 'koala'





# fb shiz
APP_ID     = ENV["FACEBOOK_APP_ID"]
APP_SECRET = ENV["FACEBOOK_SECRET"]
SITE_URL   = ENV["SITE_URL"]





def get_connection
  return @db_connection if @db_connection
  db = URI.parse(ENV['MONGOHQ_URL'] || 'mongodb://localhost:27017/badonnathon')
  db_name = db.path.gsub(/^\//, '')
  @db_connection = Mongo::Connection.new(db.host, db.port).db(db_name)
  @db_connection.authenticate(db.user, db.password) unless (db.user.nil? || db.user.nil?)
  @db_connection
end

def from_bson_id(obj) obj.merge({'_id' => obj['_id'].to_s}) end



class Song
  attr_accessor :name, :album, :popularity, :href, :artist

  def initialize(name, album, popularity, href, artist)
      @name = name
      @album = album
      @popularity = popularity
      @href = href
      @artist = artist
  end
end





class App < Sinatra::Base

  include Koala

  configure :development do
    register Sinatra::Reloader
    enable :logging
  end

  configure do  
    notes = get_connection().collection('songs')  
  end

  use Rack::Session::Cookie, secret: 'PUT_A_GOOD_SECRET_IN_HERE'
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__
  set :views, File.join('app', 'views')

  register Sinatra::AssetPack

  register Sinatra::JstPages
  serve_jst '/js/jst.js'

  # assetpack stuff
  assets do
    serve '/js',     :from => 'app/js'
    serve '/css',    :from => 'app/css'
    serve '/images', :from => File.join('public', 'images')

    # 1st param is name of asset set
    # 2nd parameter defines where the compressed version will be served.
    # 3rd param is the list of files to concatenate and minify
    js :head, '/js/head.js', [
      '/js/libs/modernizr-2.0.6.min.js'
    ]

    js :lib, '/js/lib.js', [
      '/js/libs/jquery-min.js'
    ]
    
    js :app, '/js/app.js', [
      '/js/libs/underscore-min.js',
      '/js/libs/backbone-min.js',
      '/js/jst.js',
      '/js/models/*',
      '/js/collections/*',
      '/js/views/*',
      '/js/marathonMan.js',
      'js/script.js'
    ]
    
    css :application, '/css/application.css', [
      '/css/style.css'
    ]

    js_compression  :uglify
    css_compression :less
  end

  # 404
  not_found do
    File.read(File.join('public', '404.html'))
  end




  #
  #
  # ROUTES #
  #
  #

  get '/' do

    # get total donations from virgin
    # - using live data on prod
    if ENV['RACK_ENV'] == 'production'
      j = open("http://api.jo.je/virginmoneygiving/data/280684").read
      data = JSON.parse(j);

      percent = data['money_target'].to_i / 100
      total = 100 - data['money_total'].to_i / percent

    # - using stub data on dev
    else
      data = { 'money_total' => 999,  }
      total = 25
    end

    # get songs from db
    latestSong = get_connection().collection('songs').find().sort({_id:1}).to_a.map{|t| from_bson_id(t)} || {}

    # serve template with data
    erb :"index.html", :layout => :"layout.html", :locals => {:data => data, :total => total, :latestSong => latestSong}
  end

  get '/index.json' do

    content_type :json

    # get total donations from virgin
    # - using live data on prod
    if ENV['RACK_ENV'] == 'production'
      j = open("http://api.jo.je/virginmoneygiving/data/280684").read
      data = JSON.parse(j);

      data['percent'] = data['money_target'].to_i / 100
      data['total'] = 100 - data['money_total'].to_i / percent

    # - using stub data on dev
    else
      data = { 'money_total' => 999,  }
      data['total'] = 25
    end

    # get songs from db
    data['latestSong'] = get_connection().collection('songs').find().sort({_id:1}).to_a.map{|t| from_bson_id(t)} || {}

    # serve template with data
    data.to_json
  end





  get '/playlist' do

    # get songs from db
    songs = get_connection().collection('songs').find.to_a.map{|t| from_bson_id(t)}

    # serve template with data
    erb :"playlist.html", :layout => :"layout.html", :locals => {:data => songs}
  end

  get '/playlist.json' do
    content_type :json
    get_connection().collection('songs').find.to_a.map{|t| from_bson_id(t)}.to_json
  end





  post '/playlist' do

    # add a song to the list
    song = {
      :name => params['name'],
      :album => params['album'],
      :popularity => params['popularity'],
      :href => params['href'],
      :artist => params['artist'] 
    }

    # add song from form into db
    if get_connection().collection('songs').insert(song)
      redirect '/thanks'
    end

    # redirect to 'thanks'
    "{\"_id\": \"#{oid.to_s}\"}"

    # drop cookie so this song can't be added again?
  end





  get '/donate' do
    erb :"donate.html", :layout => :"layout.html"
  end





  get '/thanks' do
    erb :"thanks.html", :layout => :"layout.html"
  end





  get '/map' do
    erb :"map.html", :layout => :"layout.html"
  end





  get '/addsong' do

    if session['access_token']
      @loggedin = true
    else
      @loggedin = false
    end

    erb :"addsong.html", :layout => :"layout.html"
  end





  get '/search' do
    s = params[:song]
    j = open("http://ws.spotify.com/search/1/track.json?q=#{URI.encode(s)}").read
    data = JSON.parse(j);

    # parse JSON into smaller array of just the data we need
    songs = []

    data['tracks'].take(10).map do |track|
      songs << Song.new( track['name'], track['album']['name'], track['popularity'], track['href'], track['artists'][0]['name'] )
    end

    erb :"search.html", :layout => :"layout.html", :locals => {:data => songs}
  end





  get '/search.json' do
    content_type :json

    s = params[:song]
    j = open("http://ws.spotify.com/search/1/track.json?q=#{URI.encode(s)}").read
    data = JSON.parse(j);

    # parse JSON into smaller array of just the data we need
    songs = []

    data['tracks'].take(10).map do |track|
      songs << {
        :name => track['name'],
        :album => track['album']['name'],
        :popularity => track['popularity'],
        :track => track['href'],
        :artist => track['artists'][0]['name']
      }
    end

    songs.to_json
  end




  # fb shiz
  get '/login' do
    # generate a new oauth object with your app data and your callback url
    session['oauth'] = Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + 'callback')
    # redirect to facebook to get your code
    redirect session['oauth'].url_for_oauth_code()
  end

  get '/logout' do
    session['oauth'] = nil
    session['access_token'] = nil
    redirect '/'
  end

  #method to handle the redirect from facebook back to you
  get '/callback' do
    #get the access token from facebook with your code
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect '/'
  end




  run! if app_file == $0
end
