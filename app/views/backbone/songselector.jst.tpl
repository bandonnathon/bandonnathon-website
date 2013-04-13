<div class="page">
  <a href="/" class="close" title="Close song selector">X</a>
  <div class="panel">
    <div class="playlist">
      <div class="inner">

        <h1>Pick your track</h1>
          
        <form action="/search" class="search-spotify clearfix">
          <input type="text" name="song" value="What song or artist are you looking for?'" />
          <input type="submit" />
        </form>

        <% if(hasResults) { %>
        <form action="/playlist" method="post">
        <ul id="results"></ul>

<!-- <a class="cta-give" href="https://uk.virginmoneygiving.com/fundraiser-web/donate/makeDonationForFundraiserDisplay.action?fundraiserActivityId=280684">Boom. Now hand over your cash. Pleeeeease</a> -->
 
          <input type="hidden" name="album" value="" />
          <input type="hidden" name="popularity" value="" />
          <input type="hidden" name="artist" value="" />
          <input type="hidden" name="href" value="" />

        <button class="cta-give">
          Give your cash to add your pumpin' track
        </button>

        </form>
        <% } %>

      </div>
    </div>
  </div>
</div>
<div class="playlistpose"></div>