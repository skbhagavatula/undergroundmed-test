function loadVideo(id) {
  var videoID = id
  var video = findVideoByid(id);
  currentPosition = video.order;

  if(ytplayer) {
    ytplayer.loadVideoById(videoID);
  }
}

// This function is called when an error is thrown by the player
function onPlayerError(errorCode) {
  alert("An error occured of type:" + errorCode);
}

// This function is automatically called by the player once it loads
function onYouTubePlayerReady(playerId) {
  ytplayer = document.getElementById("ytPlayer");
  ytplayer.addEventListener("onError", "onPlayerError");
}

// The "main method" of this sample. Called when someone clicks "Run".
function loadPlayer(id) {

  // The video to load
//  var videoID = "<%=@featured_video_id%>"
  var videoID = id
  // Lets Flash from another domain call JavaScript
  var params = { allowScriptAccess: "always" };
  // The element id of the Flash embed
  var atts = { id: "ytPlayer" };
  // All of the magic handled by SWFObject (http://code.google.com/p/swfobject/)
  swfobject.embedSWF("http://www.youtube.com/v/" + videoID +
      "?version=3&enablejsapi=1&playerapiid=player1",
      "videoDiv", "640", "385", "9", null, null, params, atts);
}