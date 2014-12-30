SC.initialize({
  client_id: request.env['SOUNDCLOUD_APP_ID']
});



var songView = function(){
  $body = $('body');
  $startButton = $('input'); // specify later
  $stopButton = $('input');
  $playbackWidget = $('widget');


}

var songLoad = function(searchParam){
  this.searchParam = searchParam
}

var snippetController = function(){
}

songLoad.prototype.searchSongs = function(){
    this.searchResults = [];
    that = this;
    SC.get('http://api.soundcloud.com/tracks', {q:that.searchParam, limit:5}, function(tracks){
      $(tracks).each(function(i, track){
        that.searchResults.push(track.id);
      });
    });
}