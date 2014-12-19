var widgetController = function(track) {
  var startTime = track.startTime;
  var stopTime = track.stopTime;
  var id = track.trackID;
  var that = this
  this.snippetTimes = [];
  $('.widget').html('<iframe id="sc-widget" src="" width="100%" scrolling="no" frameborder="no"></iframe>')
  $widgetIframe = $('#sc-widget');
  this.trackString = "https://w.soundcloud.com/player/?url=http://api.soundcloud.com/tracks/" + track.trackID + "&buying=false&show_playcount=false&show_comments=false&sharing=false";
  $widgetIframe.attr('src', this.trackString);
  this.widget = SC.Widget($widgetIframe[0]);

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

var audioTrack = function(trackID, startTime, stopTime, val) {
  this.trackID = trackID;
  this.startTime = startTime;
  this.stopTime = stopTime;
  this.$element = $('#'+ val);
}

songArray = [];
song0 = new audioTrack(177307209,30, 45, 1);
songArray.push(song0);
song1 = new audioTrack(141551003,10, 50, 2);
songArray.push(song1);
song2 = new audioTrack(60173536,10, 50, 3);
songArray.push(song2);
song3 = new audioTrack(43432304,100, 115, 4);
songArray.push(song3);
song4 = new audioTrack(71965257);
songArray.push(song4);

$.each(songArray, function(index, val) {
   $('.tracks').append("<img id='" + index +"' src='play.png'></>")
});

$('.tracks').on('click', 'img', function(){
  var index = $(this).index();
  var clickedSong = songArray[index];
  currentSnippet = new widgetController(clickedSong);
  currentSnippet.widget.bind(SC.Widget.Events.READY,function(){
    currentSnippet.widget.play();
    $widgetIframe.animate({opacity:1},1500,function(){});
  });
});

Mousetrap.bindGlobal('s n i p', function(){currentSnippet.returnSnippet(), alert('SNIP!')})
