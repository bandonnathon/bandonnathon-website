window.HomePageView = Backbone.View.extend({

    el: '#wrapper',

    template: 'backbone/home',

    events: {
        'click .money4trax': 'addSong',
        'click .playlist': 'showPlaylist'
    },

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');
    },

    addSong: function(ev) {
        ev.preventDefault();

        App.navigate('/addsong', { trigger: true });
    },

    showPlaylist: function(ev) {
        ev.preventDefault();

        App.navigate('/playlist', { trigger: true });
    },

    render: function() {
        this.$el.html(JST[this.template](this.model.toJSON()));

        return this;
    }
});