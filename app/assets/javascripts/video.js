$(document).ready(function(){
		var sessionId = $('#publisher').data('session-id');
		var sessionToken = $('#publisher').data('session-token');
		console.log(sessionId);
		console.log(sessionToken);

// Initialize Session Object
var session = OT.initSession("45192172", sessionId);

// Connect to the Session
session.connect(sessionToken, function(error) {

  // If the connection is successful, initialize a publisher and publish to the session
		  if (!error) {
		    var publisher = OT.initPublisher('publisher', {
		      insertMode: 'append',
		      width: '100%',
		      height: '100%'
		    });

		    session.publish(publisher);
		  } else {
		    console.log('There was an error connecting to the session:', error.code, error.message);
		  }
		});

	// Subscribe to a newly created stream

	session.on('streamCreated', function(event) {
	  session.subscribe(event.stream, 'subscriber', {
	    insertMode: 'append',
	    width: '100%',
	    height: '100%'
	  });
	});

});







// (function() {
// 	var video = document.getElementById('video'),
// 		vendorUrl = window.URL || window.webkitURL;

// 	navigator.getMedia =	navigator.getUserMedia ||
// 							navigator.webkitGetUserMedia ||
// 							navigator.mozGetUserMedia ||
// 							navigator.msGetUserMedia;

// 	//Capture Video
// 	navigator.getMedia(
// 	{
// 		video: true,
// 		audio: false
// 	}, function(stream) {
// 		video.src = vendorUrl.createObjectURL(stream);
// 		video.play();
// 	}, function(error) {
// 		// An error occured
// 		// error.code
// 	});
// })();