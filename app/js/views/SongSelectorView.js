window.SongSelectorView = Backbone.View.extend({

    el: '#wrapper',

    template: 'backbone/songselector',

    events: {
    	'click input[type="submit"]': 'search'
    },

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');
    },

    search: function(ev) {
    	ev.preventDefault();

    	var self = this;

    	App.searchResultsCollection.song = $('input[type="text"]').val();

    	$.when(App.searchResultsCollection.fetch()).done(function() {
    		self.render();
    	});
    },

    render: function() {
    	this.$el.empty();

        this.$el.html(JST[this.template]({ "hasResults": App.searchResultsCollection.length > 0 ? true : false }));

        var $resultsContainer = this.$el.find('#results');

        App.searchResultsCollection.each(function(result) {
        	$resultsContainer.append(new SearchResultsItemView({
        		model: result
        	}).render().el);
        });

        return this;
    }
});