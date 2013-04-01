window.PlaylistView = Backbone.View.extend({

    el: '#wrapperBehind',

    template: 'backbone/playlist',

    events: {
        'click .cta-donate': 'addSong'
    },

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');
    },

    addSong: function(ev) {
        ev.preventDefault();

        App.navigate('/addsong', { trigger: true });

        $('.flipContainer').removeClass('flipped');
    },

    render: function() {
    	this.$el.empty();

        this.$el.html(JST[this.template]({ "hasSongs": App.playlistCollection.length > 0 ? true : false }));

        var $playlistContainer = this.$el.find('#playlist');

        App.searchResultsCollection.each(function(song) {
        	$playlistContainer.append(new PlaylistItemView({
        		model: song
        	}).render().el);
        });

        $('.flipContainer').addClass('flipped');

        return this;
    }
});