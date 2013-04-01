<span class="track-name"><%= name %></span>
<span class="track-artist">by <%= artist %></span>
<form action="/playlist" method="post">
	<input type="hidden" name="name" value="<%= name %>" />
	<input type="hidden" name="album" value="<%= album %>" />
	<input type="hidden" name="popularity" value="<%= popularity %>" />
	<input type="hidden" name="artist" value="<%= artist %>" />
  <input type="hidden" name="href" value="<%= href %>" />
	<input type="submit" value="add to playlist" />
</form>