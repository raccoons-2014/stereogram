var SoundcloudUser = function(){
    this.userTracks = [],
    this.userPerm = ""
}

SoundcloudUser.prototype.searchSongs = function(){
    // var i = 0
    SC.connect(function(){
      // i++
      // if (i > 1){
        SC.get('/me/tracks', function(
          foundTracks){
          $.ajax({
            url: '/tracks',
            method: 'POST',
            data: {tracks: foundTracks},
            dataType: 'JSON'
          }).success(function(response){
            debugger
            $('body').append(response)
          })
        })
      // }
    })
  }