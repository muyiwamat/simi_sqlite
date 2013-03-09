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
//= require user

//my js code starts here
// document.write(gon.myp); // alert(gon.myp);
// alert(gon.mypostcode);
var geocoder;
var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var address = gon.mypostcode;    // var address = 'AB24 1WU';
    geocoder.geocode( { 'address': address },  function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        // var address = 'Aberdeen';
        var input = results[0].geometry.location;
        var ayodele = '"'+ input +'"';  // var ayodele = '"'+""+ input +""+'"';      // alert(ayodele);
        var split_result = ayodele.split(",",2);
        var lat_t = split_result[0];
        var lng_t = split_result[1];
        var lat = lat_t.match(/\d+.\d+/).toString();
        var lng = lng_t.match(/\D\d+.\d+/).toString();
        // alert(lat.constructor);      // alert(lng.constructor);      // var new_map = new google.maps.LatLng(lat, lng);
        map = new google.maps.LatLng(lat, lng);
        var myLatlng = map;
        var mapOptions = {
            zoom: 15,
            zoomControl:true,
            streetViewControl:true,
            zoomControlOptions: {
                style:google.maps.ZoomControlStyle.SMALL
            },
            center: map,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Hello World!'
        });

        var contentString = "Ayodele Placeholder... I shld get the place name from response";
        var infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: 200
        });

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map,marker);
        });
        var panoramaOptions = {
          position: myLatlng,
          pov: {
            heading: 24,
            pitch: 10,
            zoom: 1
          }
        };
        var panorama = new  google.maps.StreetViewPanorama(document.getElementById("pano"), panoramaOptions);
        map.setStreetView(panorama);

      } else {
           alert("Geocode was not successful for the following reason: " + status);
      }
    });
}


google.maps.event.addDomListener(window, 'load', initialize);
