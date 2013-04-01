window.PlaylistCollection = Backbone.Collection.extend({

	url: "/playlist.json",

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');
    }
});