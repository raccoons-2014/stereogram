var Throbber = function(actionButton, actionButtonClass) {
  this.$actionButton = actionButton;
  this.actionButtonClass = actionButtonClass;
}

Throbber.prototype.throb_on = function(){
  this.$actionButton.toggleClass(this.$actionButtonClass);
  throb_off();
};

Throbber.prototype.throb_off = function() {
  setTimeout(function() {
    this.$actionButton.toggleClass(this.$actionButtonClass);
  }, 2000);
};

heartThrobber = new Throbber($('<div class="heart-image"></div>'), 'heart pulse2');
heartThrobber.throb_on();
heartThrobber.throb_off();

// $('.row.collapse.track.partial').on('click', function(event){
//   var heartImage = $(this).find('.heart-image')
//   throb(heartImage);
// });

// var throb = function(heart){
//   heart.toggleClass('heart pulse2');
//     setTimeout(function() {
//   heart.toggleClass('heart pulse2');
//   }, 2000);
// }
