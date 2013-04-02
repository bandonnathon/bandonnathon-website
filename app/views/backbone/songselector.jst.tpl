<div class="page">
  <a href="#" class="close" title="Close song selector">X</a>
  <div class="panel">
    <div class="playlist">
      <div class="inner">

        <h1>Pick your track</h1>
          
        <form action="/search" class="search-spotify clearfix">
          <input type="text" name="song" value="Type a song's name or artist here" />
          <input type="submit" />
        </form>

        <% if(hasResults) { %>
        <ul id="results"></ul>
        <% } %>

      </div>
    </div>
  </div>
</div>
<div class="playlistpose"></div>