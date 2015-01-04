var Snippet = function(track, startTime, endTime){
    this.snippedAudio = track.audio;
    this.start_time = startTime;
    this.end_time = endTime;
  }

  Snippet.prototype.playSnip = function(){
    this.snippedAudio.currentTime = this.start_time;
    this.snippedAudio.play();
    this.cutoff();
  }

  Snippet.prototype.cutoff = function(){
    var that = this
    var interval = setInterval(function(){
      if (that.snippedAudio.currentTime >= that.end_time){
        that.snippedAudio.pause();
        clearInterval(interval)
      }
    }, 100 );
  }

  Snippet.prototype.playFull = function(){
    this.snippedAudio.currentTime = 0;
    this.snippedAudio.play();
  }