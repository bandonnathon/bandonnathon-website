require 'rubygems'
require 'bundler/setup'

require 'less'
require 'uglifier'

require 'sinatra/base'
require 'sinatra/assetpack'

require 'open-uri'
require 'json'

#require 'lib/sinatra/assetpackhelpers'


class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :app_file, __FILE__
  set :views, File.join('app', 'views')
  
  #set :logging, true
  register Sinatra::AssetPack

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
      '/js/NavView.js',
      '/js/SongSelectorView.js',
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

  # TODO: how to merge all these routes into one?
  get '/' do

    j = open("http://api.jo.je/virginmoneygiving/data/280684").read
    data = JSON.parse(j);

    percent = data['money_target'].to_i / 100
    total = 100 - data['money_total'].to_i / percent

    erb :"index.html", :layout => :"layout.html", :locals => {:data => data, :total => total}
  end

  get '/playlist' do
    erb :"index.html", :layout => :"layout.html"
  end

  get '/donate' do
    erb :"index.html", :layout => :"layout.html"
  end

  get '/thanks' do
    erb :"index.html", :layout => :"layout.html"
  end

  get '/map' do
    erb :"index.html", :layout => :"layout.html"
  end

  # stub json for spotify api
  get '/search' do
    content_type "application/json"
    File.readlines("public/stub.json")
  end
  
  run! if app_file == $0
end
