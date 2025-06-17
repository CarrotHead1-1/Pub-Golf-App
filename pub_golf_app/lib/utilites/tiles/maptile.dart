import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTile extends StatefulWidget {

 
  final currentLocation; 
  final nextLocation;

  MapTile({
    super.key,
    required this.currentLocation,
    required this.nextLocation,

    });

  @override
  State<MapTile> createState() => _MapTileState();
}

class _MapTileState extends State<MapTile> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25)
      ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.currentLocation[1],
          zoom: 16,
        ),

        markers: {
          Marker(
            markerId: MarkerId("current location"),
            position: widget.currentLocation[1],
            ),

          Marker(
            markerId: MarkerId("next location"),
            position: widget.nextLocation[1],
            ),
        }, 
      ),
    );
  }
}