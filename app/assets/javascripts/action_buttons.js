var Throbber = function(actionButton, actionButtonClass) {
  this.$actionButton = actionButton;
  this.actionButtonClass = actionButtonClass;
}

Throbber.prototype.throb_on = function(){
  this.$actionButton.toggleClass(this.$actionButtonClass);
  throb_off();
};

Throbber.prototype.throb_off = function() {
  var this = that
  setTimeout(function() {
    that.$actionButton.toggleClass(this.$actionButtonClass);
  }, 2000);
};

heartThrobber = new Throbber($('<div class="heart-image"></div>'), 'heart pulse2');
heartThrobber.throb_on();
heartThrobber.throb_off();
