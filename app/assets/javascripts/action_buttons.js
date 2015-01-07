var Throbber = function(actionButton, actionButtonClass) {
  this.$actionButton = actionButton;
  this.actionButtonClass = actionButtonClass;
}

Throbber.prototype.throb = function(){
  this.$actionButton.toggleClass(this.$actionButtonClass);
  throb_off();
};

Throbber.prototype.throb_off = function() {
  setTimeout(function() {
    this.$actionButton.toggleClass(this.$actionButtonClass);
  }, 2000);
};

heartThrobber = new Throbber($('<div class="heart-image"></div>'), 'heart pulse2');
heartThrobber.throb();
heartThrobber.throb_off();

// Throbber.prototype.throb = function() {
//
// }
// implement callback function that throbs first, and then throbs off
// as of now, callback is not being hit
