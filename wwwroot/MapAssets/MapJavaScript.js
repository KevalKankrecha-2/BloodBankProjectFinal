var Latitude = "";
var Longtitude = "";
alert("hi");
/**
 * Adds markers to the map highlighting the locations of the captials of
 * France, Italy, Germany, Spain and the United Kingdom.
 *
 * @param  {H.Map} map      A HERE Map instance within the application
 */
function setUpClickListener(map) {
    // Attach an event listener to map display
    // obtain the coordinates and display in an alert box.
    map.addEventListener("tap", function (evt) {
        var coord = map.screenToGeo(
            evt.currentPointer.viewportX,
            evt.currentPointer.viewportY
        );

        Langtitude = coord.lng.toFixed(4);
        Latitude = coord.lat.toFixed(4);
        document.getElementById('Longitude').value = coord.lng.toFixed(4);
        document.getElementById('Latitude').value = coord.lat.toFixed(4);

        addMarkersToMap(map);
        logEvent(
            "Clicked at " +
            Math.abs(coord.lat.toFixed(4)) +
            (coord.lat > 0 ? "N" : "S") +
            " " +
            Math.abs(coord.lng.toFixed(4)) +
            (coord.lng > 0 ? "E" : "W")
        );
    });
}

function addMarkersToMap(map) {

    var parisMarker = new H.map.Marker({ lat: Latitude, lng: Langtitude });

    map.addObject(parisMarker);

}

/**
 * Boilerplate map initialization code starts below:
 */

//Step 1: initialize communication with the platform
// In your own code, replace variable window.apikey with your own apikey
var platform = new H.service.Platform({
    apikey: '4ney5rjVXbHObPk5VdlbHz-okelFOLmIhVW8BhrZ9Sg'
});
var defaultLayers = platform.createDefaultLayers();

//Step 2: initialize a map - this map is centered over Europe
var map = new H.Map(document.getElementById('map'),
    defaultLayers.vector.normal.map, {
    center: { lat: 22.6708, lng: 71.5724 },
    zoom: 4,
    pixelRatio: window.devicePixelRatio || 1
});
// add a resize listener to make sure that the map occupies the whole container
window.addEventListener('resize', () => map.getViewPort().resize());

//Step 3: make the map interactive
// MapEvents enables the event system
// Behavior implements default interactions for pan/zoom (also on mobile touch environments)
var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));

// Create the default UI components
var ui = H.ui.UI.createDefault(map, defaultLayers);



// Now use the map as required...
setUpClickListener(map);