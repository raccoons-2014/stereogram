var widgetContoller = function(track) {
  var start = track.startTime;
  var stop = track.stopTime;
  var id = track.trackID;

  this.snippetTimes = [];
  $widgetIframe = $('#sc-widget');
  trackString = "https://w.soundcloud.com/player/?url=http://api.soundcloud.com/tracks/" + track.trackID + "&buying=false&show_playcount=false&show_comments=false&sharing=false";
  $widgetIframe.attr('src', trackString);
  widget = SC.Widget($widgetIframe[0]);
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

var someAudio = function(trackID, startTime, stopTime, val) {
  this.trackID = trackID;
  this.startTime = startTime;
  this.stopTime = stopTime;
  this.$element = $('#'+ val);
}

song = new someAudio(177307209,30, 45, 1);
test = new widgetContoller(song);
song.$element.on('click', function(){
  $widgetIframe.css('display','block'),
  widget.play()});


Mousetrap.bindGlobal('s n i p', function(){test.returnSnippet(), alert('SNIP!')})
