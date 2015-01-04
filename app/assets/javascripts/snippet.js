var Snippet = function(track, startTime, endTime){
    this.snippedAudio = track.audio;
    this.start_time = startTime;
    this.end_time = endTime;
  }

  Snippet.prototype.playSnip = function(){
    this.snippedAudio.currentTime = this.startTime;
    this.snippedAudio.play();
    this.cutoff();
  }

  Snippet.prototype.cutoff = function(){
    setInterval(function(){
      if (this.snippedAudio.currentTime >= this.endTime){
        this.snippedAudio.pause();
      }
    }, 100 );
  }

  // Snippet.prototype.playFull = function(){
  //   this.track.audio.play();
  // }