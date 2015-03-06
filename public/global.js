// functions
var currentSlide = 1

//load first slide when page is refreshed

window.onload = function(){
  var req = new XMLHttpRequest;
  sendRequest(req);
}

//format slide

var singleSlide = function(eventObject){
  var object = JSON.parse(this.response);
  document.getElementById("title").innerHTML = object.title;
  document.getElementById("text").innerHTML = object.slide_text; 
} 


//for each onclick, load the next slide in numerical order
//Next

function forwardButton(numSlides) {
  currentSlide++
  if (currentSlide > numSlides){
    currentSlide = 1
  }
  var request = new XMLHttpRequest;

  sendRequest(request);
}

//Back

function backButton(numSlides) {
  currentSlide--
  
  if (currentSlide < 1){  
    currentSlide = numSlides
  }
  var request = new XMLHttpRequest;
  sendRequest(request);
}

// request function

var sendRequest = function(request) {
  request.open("post", "http://localhost:4567/slide/" + currentSlide);
  request.send();
  request.addEventListener("load", singleSlide);
}