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

        <a class="cta-give" href="https://uk.virginmoneygiving.com/fundraiser-web/donate/makeDonationForFundraiserDisplay.action?fundraiserActivityId=280684">Boom. Now hand over your cash. Pleeeeease</a>
        <% } %>

      </div>
    </div>
  </div>
</div>
<div class="playlistpose"></div>