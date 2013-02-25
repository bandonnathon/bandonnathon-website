window.MarathonMan = Backbone.Router.extend({
        
    routes: {
        'playlist': 'playlist',
        '': 'home',
        'home': 'home',
        'donate': 'donate',
        'thanks': 'thanks',
        'map': 'map'
    },

    initialize: function() {

        _.bindAll(this, 'playlist');

        this.songSelectorView = new SongSelectorView( {

            el : $('#app')
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
        $('#container').text('now at home');
    },

    playlist: function() {
        $('#container').empty();
        $('#container').text('now at playlist');

        // show the song selector
        this.songSelectorView.show();
    },

    donate: function() {
        $('#container').empty();
        $('#container').text('now at donate');
    },

    thanks: function() {
        $('#container').empty();
        $('#container').text('now at thanks');
    },

    map: function() {
        $('#container').empty();
        $('#container').text('now at map');
    }
});