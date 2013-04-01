<div class="page">
  <div class="panel">
    <div class="playlist">
      <div class="inner">

        <h1>Choose your track</h1>
          
        <form action="/search" class="search-spotify clearfix">
          <input type="text" name="song" placeholder="Type a song's name or artist here" />
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