var SoundcloudUser = function(){
  this.userTracks = [],
  this.userPerm = ""
}

SoundcloudUser.prototype.searchSongs = function(callback){
  SC.connect(function(){
    SC.get('/me/tracks', function(
      foundTracks){
      $.ajax({
        url: '/tracks',
        method: 'POST',
        data: {tracks: foundTracks},
        dataType: 'JSON'
      }).success(function(response){
        callback(response);
      })
    })
  })
}
