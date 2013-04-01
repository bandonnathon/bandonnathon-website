window.AboutView = Backbone.View.extend({
	el: '#wrapperBehind',

	template: 'Backbone/about',

	render: function () {
		this.$el.html(JST[this.template]);
		return this;
	}
});