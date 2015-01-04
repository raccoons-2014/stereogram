function Track(opts){
    this.source_id = opts.id;
    this.permalink_url = opts.permalink_url;
    this.artwork_url = opts.artwork_url;
    this.description = opts.description;
    this.duration = opts.duration;
    this.waveform_url = opts.waveform_url;
    this.bpm = opts.bpm;
    this.stream_url = opts.stream_url;
    this.audio = {};
}