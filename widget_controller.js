var widgetContoller = function(start, stop) {
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

test = new widgetContoller(95,120);
Mousetrap.bind('command+j', function() { this.widget.getPosition(function(pos){alert(pos)}) }).bind(test);
