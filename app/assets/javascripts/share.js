$('.share').on('click', function(e){
  e.preventDefault();
  if(e.target.classList[0] === 'track-share'){
    var shareData = {track_id: e.target.parentElement.id}
  } else{
    var shareData = {snippet_id: e.target.parentElement.id}
  }
  share(shareData)
})

var share = function(shareData){
  $.ajax({
    url: '/share',
    method: 'POST',
    data: shareData
  })
}