function Track(opts){
    this.id = opts.id
    this.source_id = opts.source_id;
    this.permalink_url = opts.permalink_url;
    this.artwork_url = opts.artwork_url;
    this.description = opts.description;
    this.duration = opts.duration;
    this.waveform_url = opts.waveform_url;
    this.bpm = opts.bpm;
    this.stream_url = this.getStreamUrl();
    this.audio = this.audioCreator();
}

Track.prototype.getStreamUrl = function() {
  return "http://api.soundcloud.com/tracks/"+ this.source_id +"/stream?client_id=ce2d05f718bd31feba35c78daaa99c23"
};

Track.prototype.audioCreator = function(){
    return new Audio(this.stream_url)
}