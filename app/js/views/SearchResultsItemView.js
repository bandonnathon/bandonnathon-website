window.SearchResultsItemView = Backbone.View.extend({

    tagName: 'li',

    template: 'backbone/searchresultsitem',

    initialize: function() {
        //_.bindAll(this, 'render');

        //$(this.el).html('<ul><li><a id="pl">playlist</a></li><li><a id="dn">donate</a></li><li><a id="th">thanks</a></li><li><a id="mp">map</a></li><li><a id="hm">home</a></li></ul>');

        this.$el.on('click', jQuery.proxy(this.selectTrack, this));
    },

    selectTrack: function (event) {
        var radio = this.$el.find('input[type="radio"]');
        var form = this.$el.parents('form');
        var hiddenInputs = form.find('input[type="hidden"]');

        this.$el.siblings().removeClass('selected');

        this.$el.addClass('selected');
        radio.prop('checked', true);

        for (var i = 0, l = hiddenInputs.length; i < l; i++) {
            var input = $(hiddenInputs[i]);
            for (var attr in radio.data()) {
                if (radio.data().hasOwnProperty) {
                    if (input.attr('name') === attr) {
                        console.log(radio.data()[attr]);
                        input.prop('value', radio.data()[attr]);
                    }
                }
            }
        }
    },

    render: function() {
        this.$el.html(JST[this.template](this.model.toJSON()));

        return this;
    }
});