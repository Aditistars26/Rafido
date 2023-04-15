import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';
import 'package:flutter_osm_web/flutter_osm_web.dart';
import 'package:flutter_osm_web/src/controller/web_osm_controller.dart';
import 'package:provider_counter/utils/utils.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

MapController controller = MapController.customLayer(
  initMapWithUserPosition: false,
  initPosition: GeoPoint(
    latitude: 47.4358055,
    longitude: 8.4737324,
  ),
  
  customTile: CustomTile(
    sourceName: "opentopomap",
    tileExtension: ".png",
    minZoomLevel: 2,
    maxZoomLevel: 19,
    urlsServers: [
      TileURLs(
        url: "https://tile.opentopomap.org/",
        subdomains: [],
      )
    ],
    tileSize: 256,
  ),
)
;

class _MyMapState extends State<MyMap> {
  @override
  Widget build(BuildContext context) {
    MapController currentLocation=await MapController.currentLocation();
    return OSMFlutter(
      
      controller: controller,
      trackMyPosition: false,
      initZoom: 12,
      minZoomLevel: 8,
      maxZoomLevel: 14,
      stepZoom: 1.0,
      userLocationMarker: UserLocationMaker(
        personMarker: MarkerIcon(
          icon: Icon(
            Icons.location_history_rounded,
            color: Colors.red,
            size: 48,
          ),
        ),
        directionArrowMarker: MarkerIcon(
          icon: Icon(
            Icons.double_arrow,
            size: 48,
          ),
        ),
      ),
      roadConfiguration: RoadOption(
        roadColor: Colors.yellowAccent,
      ),
      markerOption: MarkerOption(
          defaultMarker: MarkerIcon(
        icon: Icon(
          Icons.person_pin_circle,
          color: Colors.blue,
          size: 56,
        ),
      )),
    );
  }
}
