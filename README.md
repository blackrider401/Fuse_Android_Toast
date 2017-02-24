# Fuse - Android Toast
Android Toast View for fuse

# Usage
1 - Add the toast.uno file to you project directory

2 - In your JavaScript file:

	var deviceToast = require("deviceToast");

	function sendToast(msg){
		var msg = "Android Toast is Working";
		deviceToast.toastIt(msg)
	}

	module.exports ={
		sendToast
	}
3 - In your UX file:

	<Button Clicked="{sendToast}" Text="Click Me"/>