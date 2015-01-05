// Some people like to namespace JS objects
//
Stereogram.Snippet = function(opts){
  this.snippedAudio = opts.track.audio;
  this.track_id = opts.track.id
  this.start_time = opts.startTime;
  this.end_time = opts.endTime;
}

Stereogram.Snippet.prototype.playSnip = function(){
  this.snippedAudio.currentTime = this.start_time;
  this.snippedAudio.play();
  this.cutoff();
}

Stereogram.Snippet.prototype.cutoff = function(){
  var that = this
  var interval = setInterval(function(){
    if (that.snippedAudio.currentTime >= that.end_time){
      that.snippedAudio.pause();
      clearInterval(interval)
    }
  }, 100 );
}

Stereogram.Snippet.prototype.playFull = function(){
  this.snippedAudio.currentTime = 0;
  this.snippedAudio.play();
}
