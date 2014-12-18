var widgetContoller = function(start, stop) {
  this.snippetTime = 0
  widgetIframe = document.getElementById('sc-widget'),
  widget = SC.Widget(widgetIframe);
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
    that.snippetTime = pos;
  })
}

test = new widgetContoller(0);
Mousetrap.bindGlobal('command+j', function(){test.returnSnippet()})
