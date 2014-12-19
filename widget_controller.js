var widgetController = function(track) {
  var startTime = track.startTime;
  var stopTime = track.stopTime;
  var id = track.trackID;
  var that = this
  this.snippetTimes = [];
  $widgetIframe = $('#sc-widget');
  this.trackString = "https://w.soundcloud.com/player/?url=http://api.soundcloud.com/tracks/" + track.trackID + "&buying=false&show_playcount=false&show_comments=false&sharing=false";
  $widgetIframe.attr('src', this.trackString);
  this.widget = SC.Widget($widgetIframe[0]);

  //Emmit Ready Event... have another function that is listening for that event...

  // play...
  this.widget.bind(SC.Widget.Events.READY, function() {
    that.widget.setVolume(50);
  });

  this.widget.bind(SC.Widget.Events.PLAY, function() {
    that.widget.seekTo(startTime*1000);
  });

  this.widget.bind(SC.Widget.Events.PLAY_PROGRESS, function() {
    that.widget.getPosition(function(position) {
      if (position > stopTime*1000){that.widget.pause()}
      });
  });
};

widgetController.prototype.returnSnippet = function() {
  var that = this;
  this.widget.getPosition(function(pos){
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



$.each(songArray, function(index, val) {
   $('.tracks').append("<img id='" + index +"' src='play.png'></>")
});

$('.tracks').on('click', 'img', function(){
  var index = $(this).index();
  var clickedSong = songArray[index];
  test = new widgetController(clickedSong);
  test.widget.bind(SC.Widget.Events.READY,function(){
    $widgetIframe.delay(300).css('display','block');
    setTimeout(test.widget.play(),100);
  });
});


Mousetrap.bindGlobal('s n i p', function(){test.returnSnippet(), alert('SNIP!')})
