var widgetContoller = function(track) {
  var start = track.startTime;
  var stop = track.stopTime;
  var id = track.trackID;

  this.snippetTimes = []
  $widgetIframe = $('#sc-widget');
  trackString = "https://w.soundcloud.com/player/?url=http://api.soundcloud.com/tracks/" + track.trackID + "&buying=false&show_playcount=false&show_comments=false&sharing=false";
  $widgetIframe.attr('src', trackString);
  widget = SC.Widget($widgetIframe);
  widget.bind(SC.Widget.Events.READY, function() {
    widget.bind(SC.Widget.Events.PLAY, function() {
      widget.getCurrentSound(function(currentSound){});
      widget.seekTo(start*1000);
      widget.bind(SC.Widget.Events.PLAY_PROGRESS, function() {
        widget.getPosition(function(position) {
          if (position > stop*1000){widget.pause();}
        });
      });
    });
  widget.setVolume(50);
  });
};

widgetContoller.prototype.returnSnippet = function() {
  var that = this;
  widget.getPosition(function(pos){
    that.snippetTimes.push(Math.floor(pos));
  })
}

var someAudio = function(trackID, startTime, stopTime) {
  this.trackID = trackID;
  this.startTime = startTime;
  this.endTime = stopTime;
}

song = new someAudio(177307209,30, 45);

test = new widgetContoller(song);
Mousetrap.bindGlobal('s n i p', function(){test.returnSnippet(), alert('SNIP!')})
