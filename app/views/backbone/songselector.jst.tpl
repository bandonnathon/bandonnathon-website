<div class="page">
  <div class="welcome">
    <div class="playlist">
      <div class="inner">

        this is where the select-a-song form goes
          
          <form action="/search">
          <input type="text" name="song" value="type a song's name or artist here" />
          <input type="submit" />
          </form>

      </div>
      <span class="border"></span>
    </div>
      <% if(hasResults) { %>
        <ul id="results"></ul>
      <% } %>
  </div>
</div>