window.MarathonMan = Backbone.Router.extend({
        
    routes: {
        'playlist': 'playlist',
        '': 'home',
        'home': 'home',
        'addsong': 'addsong',
        'donate': 'donate',
        'thanks': 'thanks',
        'map': 'map'
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

        this.playlistCollection = new PlaylistCollection();

        this.playlistView = new PlaylistView( {
            collection : this.playlistCollection
            // collection: ? 
            // player: ?
            // library: ?
            // search: ?
        } );

        this.navView = new NavView( {
            
            el : $('#nav')

        } );

    },

    home: function() {
        //$('#container').text('now at home');

        var self = this;

        this.homePage = new HomePageModel();

        $.when(this.homePage.fetch()).done(function() {
            self.homePageView = new HomePageView({
                model: self.homePage
            }).render();
        });
    },

    addsong: function() {
        this.songSelectorView.render();
    },

    playlist: function() {
        //$('#container').empty();
        //$('#container').text('now at playlist');

        // show the song selector
        this.playlistView.render();
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
    }
});