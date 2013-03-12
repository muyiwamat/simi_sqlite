// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

var geocoder;
// var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var address = gon.mypostcode; // var address = "Airyhall Library";
    geocoder.geocode( { 'address': address },  function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var input = results[0].geometry.location;
        var ayodele = '"'+ input +'"';
        var split_result = ayodele.split(",",2);
        var lat_t = split_result[0];
        var lng_t = split_result[1];
        var lat = lat_t.match(/\d+.\d+/).toString();
        var lng = lng_t.match(/\D\d+.\d+/).toString();
        var userLocation = new google.maps.LatLng(lat, lng);
        var panoramaOptions = {
          position: userLocation,
          pov: {
            heading: 0,
            pitch: 0
          },
            zoom: 1,
            mapTypeControl: true,
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
            },
            zoomControl: true,
            zoomControlOptions: {
                style: google.maps.ZoomControlStyle.SMALL
            }
        };
        var myPano = new google.maps.StreetViewPanorama(document.getElementById("pano"), panoramaOptions);
        var marker = new google.maps.Marker({
            map: myPano,
            animation: google.maps.Animation.BOUNCE,
            position: userLocation
        });
        myPano.setVisible(true);
        marker.setTitle(address);
        var infowindow = new google.maps.InfoWindow({
            content: "Your Location"
        });
        google.maps.event.addListener(infowindow, 'onload', function () {
            infowindow.setContent();
        });
        google.maps.event.addListener(marker, 'click', toggleBounce);

      } else {
           alert("Geocode was not successful for the following reason: " + status);
           document.write('<div id="map_error">'+'<h1>Geocode was not successful for the following reason: + status</h1>'+status+'</div>');
      }
    });
}
      function toggleBounce() {

        if (marker.getAnimation() != null) {
          marker.setAnimation(null);
        } else {
          marker.setAnimation(google.maps.Animation.BOUNCE);
        }
      }


google.maps.event.addDomListener(window, 'load', initialize);
