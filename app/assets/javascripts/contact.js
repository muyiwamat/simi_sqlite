  //   var map;
  //   var infowindow;
  //     function initialize() {
  //       // var church_location = new google.maps.LatLng(57.14745,-2.096481);
  //        // var church_location = new google.maps.LatLng(57.14658,-2.097064);
  //       var church_location = new google.maps.LatLng(57.14745,-2.096238);
  //       map = new google.maps.Map(document.getElementById("map_canvas"), {
  //         mapTypeId: google.maps.MapTypeId.ROADMAP,
  //         center: church_location,
  //         zoom: 17
  //       });
  //       var panoramaOptions = {
  //         position: church_location,
  //         pov: {
  //           heading: 24,
  //           pitch: 10,
  //           zoom: 1
  //         }
  //       }
  //       var panorama = new google.maps.StreetViewPanorama(document.getElementById("pano"), panoramaOptions);
  //       map.setStreetView(panorama);
  //       var request = {
  //         // reference: 'CnRkAAAAGnBVNFDeQoOQHzgdOpOqJNV7K9-c5IQrWFUYD9TNhUmz5-aHhfqyKH0zmAcUlkqVCrpaKcV8ZjGQKzB6GXxtzUYcP-muHafGsmW-1CwjTPBCmK43AZpAwW0FRtQDQADj3H2bzwwHVIXlQAiccm7r4xIQmjt_Oqm2FejWpBxLWs3L_RoUbharABi5FMnKnzmRL2TGju6UA4k'
  //         reference: church_location
  //       };
  //       infowindow = new google.maps.InfoWindow();
  //       var service = new google.maps.places.PlacesService(map);
  //       service.getDetails(request, callback);
  //     }
  //     function callback(place, status) {
  //       if (status == google.maps.places.PlacesServiceStatus.OK) {
  //        createMarker(place); 
  //       }
  //     }

  // function createMarker (place) {
  //   // body...
  //   var place_location = place.geometry.location;
  //   var marker = new google.maps.Marker({
  //     map: map,
  //     // position: place.geometry.location,
  //     position: church_location,
  //     title: "Church"
  //   });
  //   google.maps.event.addListener(marker, 'click', function() {
  //     infowindow.setContent(place.name);
  //     infowindow.open(map, this);
  //   });
  // }

  // google.maps.event.addDomListener(window, 'load', initialize);
