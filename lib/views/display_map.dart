import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';
import 'package:flutter_osm_web/flutter_osm_web.dart';
import 'package:flutter_osm_web/src/controller/web_osm_controller.dart';
import 'package:provider_counter/utils/utils.dart';

void main() {
  runApp(MapApp());
}

class MapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenStreetMap Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('OpenStreetMap Example'),
        ),
        body: FlutterMap(
          options: MapOptions(
            center: LatLng(51.5074, -0.1278),
            zoom: 13.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],

            ),
          ],
        ),
      ),
    );
  }
}
