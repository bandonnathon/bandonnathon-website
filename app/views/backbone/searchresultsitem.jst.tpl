<b><%= name %></b> on album 
<b><%= album %></b> by 
<b><%= artist %></b> 
(popularity: <%= popularity %>)

<p>
  <form action="/playlist" method=POST>
    <input type="hidden" name="name" value="<%= name %>" />
    <input type="hidden" name="album" value="<%= album %>" />
    <input type="hidden" name="popularity" value="<%= popularity %>" />
    <input type="hidden" name="artist" value="<%= artist %>" />
    <input type="submit" value="add to playlist" />
  </form>
</p>