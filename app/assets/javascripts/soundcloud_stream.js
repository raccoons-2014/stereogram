SC.initialize({
  client_id: request.env['SOUNDCLOUD_APP_ID']
});

var songView = function(){



}

var songLoad = function(){



}

var snippetController = function(){
}

snippetController.prototype.getSong = function(track, artist) {
  SC.get('/tracks', {q:track,q:artist}, function(tracks){});}