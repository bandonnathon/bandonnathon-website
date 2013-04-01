<div class="page">
	
	<div class="donation">
		<div class="inner">
			<a href="/addsong" class="money4trax">Give your cash to add your fave track</a>
			<span class="donation-intro">Big up you've raised</span>
			<span class="donation-total">&pound;<%= money_total %></span>
			<span class="donation-meter"><span style="height: 20px; width: <%= total %>%; display: block; background: url(/images/donation-meter-target-dark.gif);"></span></span>
			<a href="/about" class="donation-charity">for the Terrence Higgins Trust</a>
		</div>
	</div>

	<div class="welcome">
		<img src="/images/logo-badonna.png" alt="Badonnathon">
		<div class="strap">
			<a href="/addsong">Add your track &amp; help kick HIV's ass</a>
			<iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.badonnathon.com&amp;send=false&amp;layout=button_count&amp;width=90&amp;show_faces=false&amp;font&amp;colorscheme=light&amp;action=like&amp;height=21&amp;appId=374956165952121" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:90px; height:21px;" allowTransparency="true"></iframe>
		</div>
	</div>

	<div class="player">
		<div class="inner">
			<a href="/playlist" class="playlist">Check out the marathon mix</a>
				<div class="latestSong">
					<% _.each(latestSong, function(song) { %>
					<iframe src="https://embed.spotify.com/?uri=<%= song.href %>" width="300" height="80" frameborder="0" allowtransparency="true"></iframe>
					<% }) %>
				</div>
		</div>
		<span class="border"></span>
	</div>

	<div id="container"></div>

	<div id="nav"></div>
</div>

<div class="pose"></div>