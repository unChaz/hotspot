// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

var hotspot = window.hotspot = {};
hotspot.openInfoWindows = [];

function getLocation() {
  if (navigator.geolocation){
    navigator.geolocation.getCurrentPosition(setPosition);
  }
}

function setPosition(position){
  window.latitude = position.coords.latitude;
  window.longitude = position.coords.longitude; 
  var mapOptions = {
    center: new google.maps.LatLng(window.latitude || 33.57343, window.longitude || -85.09874000000001),
    zoom: 18
  };
  window.hotspot.map = new google.maps.Map(document.getElementById("map-canvas"),
      mapOptions);
}

function initializeGmap() {
  if (navigator.geolocation){
    navigator.geolocation.getCurrentPosition(setPosition);
  } else {
    console.log("No geolocation available.");
  }
}

hotspot.addMarkerToMap = function(lat, long, name, description, id){
  var contentString = '<div id="content">'+
      '<div id="siteNotice">'+
      '</div>'+
      '<h1 id="firstHeading" class="firstHeading">' + name + '</h1>'+
      '<div id="bodyContent">'+
      '<p>' + description + '</p>'+
      '<p><a href="/' + id + '" class="btn btn-primary">Go!</a>' +
      '</p>'+
      '</div>'+
      '</div>';

  var infowindow = new google.maps.InfoWindow({
      content: contentString
  });

  var image = {
    url: "/assets/pepper.png",
    size: new google.maps.Size(20, 32),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(0, 32)
  };

  var marker = new google.maps.Marker({
      title: name,
      map: window.hotspot.map,
      icon: image,
      position: new google.maps.LatLng(lat, long)
  });

  google.maps.event.addListener(marker, 'click', function() {
    hotspot.openInfoWindows.forEach(function(iw) {
      iw.close();
    });
    infowindow.open(window.hotspot.map,marker);
    hotspot.openInfoWindows.push(infowindow);
  });
}

hotspot.addMarkerIconToMap = function(lat, long){
  var image = {
    url: "/assets/pepper.png",
    size: new google.maps.Size(20, 32),
    origin: new google.maps.Point(0,0),
    anchor: new google.maps.Point(0, 32)
  };

  var marker = new google.maps.Marker({
      map: window.hotspot.map,
      icon: image,
      position: new google.maps.LatLng(lat, long)
  });
}

hotspot.codeAddress = function(address) {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({
        'address': address
    }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          window.hotspot.map.setCenter(new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng()));
        }
    });
}

hotspot.initialize = function(){
  getLocation();
  google.maps.event.addDomListener(window, 'load', initializeGmap);
}   
