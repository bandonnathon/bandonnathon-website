window.MarathonMan = Backbone.Router.extend({

    routes: {
        'playlist': 'playlist',
        '': 'home',
        'home': 'home',
        'addsong': 'addsong',
        'donate': 'donate',
        'thanks': 'thanks',
        'map': 'map',
        'about': 'about'
    },

    initialize: function() {

        _.bindAll(this, 'playlist');

        this.searchResultsCollection = new SearchResultsCollection();

        this.songSelectorView = new SongSelectorView( {
            // collection: ? 
            // player: ?
            // library: ?
            // search: ?
        } );

        this.homePage = new HomePageModel();

        this.playlist = new PlaylistCollection();

        this.flippinView = new FlippinView();

        this.navView = new NavView( {

            el : $('#nav')

        } );

        this.aboutView = new AboutView();

    },

    home: function() {
        this.flippinView.render('home');
    },

    playlist: function() {
        this.flippinView.render('playlist');
    },

    addsong: function() {
        this.songSelectorView.render();
    },

    donate: function() {
        //$('#container').empty();
        //$('#container').text('now at donate');
    },

    thanks: function() {
        // $('#container').empty();
        // $('#container').text('now at thanks');
    },

    map: function() {
        // $('#container').empty();
        // $('#container').text('now at map');
    },

    about: function () {
        this.aboutView.render();
    }
});