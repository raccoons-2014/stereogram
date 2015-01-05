var SoundcloudUser = function(){
    this.userTracks = [],
    this.userPerm = ""
}

SoundcloudUser.prototype.searchSongs = function(){
  SC.initialize({
    client_id: "b99714ff12392f9d7e1498ab5166732d",
    redirect_uri: 'http:localhost:3000/callback'
  });

    SC.connect(function(){
        SC.get('/me/tracks', function(
          foundTracks){
          $.ajax({
            url: '/tracks',
            method: 'POST',
            data: {tracks: foundTracks},
            dataType: 'JSON'
          }).success(function(response){
            $('body').append(response)
          })
        })
    })
  }