var Snippet = function(opts){
    this.snippedAudio = opts.track.audio;
    this.track_id = opts.track.id
    this.start_time = opts.startTime;
    this.end_time = opts.endTime;
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