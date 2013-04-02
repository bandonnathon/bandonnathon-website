window.PlaylistView = Backbone.View.extend({

    el: '#flipBack',

    template: 'backbone/playlist',

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');
    },

    render: function() {
    	this.$el.empty();

        this.$el.html(JST[this.template]({ "hasSongs": App.playlist.length > 0 ? true : false }));

        var $playlistContainer = this.$el.find('#playlist');

        App.playlist.each(function(song) {
        	$playlistContainer.append(new PlaylistItemView({
        		model: song
        	}).render().el);
        });

        return this;
    }
});