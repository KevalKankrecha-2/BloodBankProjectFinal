let lat = document.getElementById("lat").value;
let lgn = document.getElementById("lng").value;


/**
 * Adds markers to the map highlighting the locations of the captials of
 * France, Italy, Germany, Spain and the United Kingdom.
 *
 * @param  {H.Map} map      A HERE Map instance within the application
 */
function addMarkersToMap(map) {
    var parisMarker = new H.map.Marker({ lat: lat, lng: lgn });
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
    center: { lat: 27, lng: 71 },
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
window.onload = function () {
    addMarkersToMap(map);
}