var widgetController = function(track) {
  var start = track.startTime;
  var stop = track.stopTime;
  var id = track.trackID;

  this.snippetTimes = [];
  $widgetIframe = $('#sc-widget');
  this.trackString = "https://w.soundcloud.com/player/?url=http://api.soundcloud.com/tracks/" + track.trackID + "&buying=false&show_playcount=false&show_comments=false&sharing=false";
  $widgetIframe.attr('src', this.trackString);
  widget = SC.Widget($widgetIframe[0]);
  widget.bind(SC.Widget.Events.READY, function() {
    widget.bind(SC.Widget.Events.PLAY, function() {
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

widgetController.prototype.returnSnippet = function() {
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
songArray = [];
song1 = new someAudio(177307209,30, 45, 1);
songArray.push(song1);
song2 = new someAudio(141551003,10, 50, 2);
songArray.push(song2);
song3 = new someAudio(60173536,10, 50, 3);
songArray.push(song3);
song4 = new someAudio(43432304,100, 115, 4);
songArray.push(song4);
song5 = new someAudio(71965257,10, 50, 5);
songArray.push(song5);
// test = new widgetController(song1);

$('body').on('click', 'img', function(){
  var index = $(this).index();
  var clickedSong = songArray[index];
  test = new widgetController(clickedSong);
  widget.bind(SC.Widget.Events.PLAY,function(){
    $widgetIframe.css('display','block');
  });
});


Mousetrap.bindGlobal('s n i p', function(){test.returnSnippet(), alert('SNIP!')})
