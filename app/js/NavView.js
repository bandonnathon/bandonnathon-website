window.NavView = Backbone.View.extend({

    events: {
        'click #hm': 'home',
        'click #pl': 'playlist',
        'click #dn': 'donate',
        'click #th': 'thanks',
        'click #mp': 'map'
    },

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');
    },

    home: function() {
        App.navigate("/home", { trigger: true });
    },

    playlist: function() {
        App.navigate("/playlist", { trigger: true });
    },

    donate: function() {
        App.navigate("/donate", { trigger: true });
    },

    map: function() {
        App.navigate("/map", { trigger: true });
    },

    thanks: function() {
        App.navigate("/thanks", { trigger: true });
    }
});