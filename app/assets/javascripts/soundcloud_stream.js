

var track = function(opts){
  this.id = opts[id];
  this.permalinkUrl = opts[permalinkUrl];
  this.artworkUrl = opts[artworkUrl];
  this.description = opts[description];
  this.duration = opts[duration];
  this.waveformUrl = opts[waveformUrl];
  this.bpm = opts[bpm];
}

var songView = function(){
  $body = $('body');
  $startButton = $('input');
  $stopButton = $('input');
  $playbackWidget = $('widget');
}

var songLoad = function(){
  this.userTracks = [];
}

var snippetController = function(){
}

songLoad.prototype.searchSongs = function(){
  that = this;
  SC.get('http://api.soundcloud.com/me/tracks', function(tracks){
    $(tracks).each(function(i, userTrack){
      that.userTracks.push(new track(
        opts = {
          id = userTrack.id,
          permalinkUrl = userTrack.permalinkUrl,
          artworkUrl = userTrack.artworkUrl,
          description = userTrack.description,
          duration = userTrack.duration,
          waveformUrl = userTrack.waveformUrl,
          bpm = userTrack.bpm
        }));
    });
  });
}