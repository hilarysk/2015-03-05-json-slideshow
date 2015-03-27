// document.getElementById('youridhere').scrollIntoView(); --> have scroll up on typewriter for daily fem or here?

//<a href="https://www.flickr.com/photos/picsfromj/3452211626" title="drive-in by Joyce Pedersen, on Flickr"><img src="https://farm4.staticflickr.com/3352/3452211626_2586e54aef_s.jpg" width="75" height="75" alt="drive-in"></a>







var currentSlide = 1

// Load first slide when page is refreshed

window.onload = function(){
  var req = new XMLHttpRequest;
  sendRequest(req);
}

// Get slide information

var sendRequest = function(request) {
  request.open("post", "http://localhost:4567/slide/" + currentSlide);
  request.send();
  request.addEventListener("load", singleSlide);
}
// Format slide

var singleSlide = function(eventObject){
  var object = JSON.parse(this.response);
  document.getElementById("text").innerHTML = object.slide_text; 
} 

// Next button

function forwardButton(numSlides) {
  currentSlide++
  if (currentSlide > numSlides){
    currentSlide = 1
  }
  var request = new XMLHttpRequest;

  sendRequest(request);
}

// Back button

function backButton(numSlides) {
  currentSlide--
  
  if (currentSlide < 1){  
    currentSlide = numSlides
  }
  var request = new XMLHttpRequest;
  sendRequest(request);
}

