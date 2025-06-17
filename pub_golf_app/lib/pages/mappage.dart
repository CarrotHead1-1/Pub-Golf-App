import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPage extends StatefulWidget {

  final currentLocation; 
  final nextLocation;

  MapPage({
    super.key,
    required this.currentLocation,
    required this.nextLocation,
    
    });

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  //variable used to store the next location
  late var currentLocation =  widget.currentLocation;
  late var nextLocation = widget.nextLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Map Page"),
        elevation: 0,
      ),
      
      body: ListView(
        children: [ 
          //google maps container   
          Container(
            height: 600,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: currentLocation[1],
                zoom: 14.5,
              ),
              //Displays markers onto the google map
              markers: {
                Marker(
                  markerId: MarkerId("current location"),
                  position: currentLocation[1],
                  
                  ),
                
                Marker(
                  markerId: MarkerId("next location"),
                  position: nextLocation[1],
                  
                  ),
              },

            ),
          ),

          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Text('This Location: ${currentLocation[0]}: ${currentLocation[2]}'),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
              child: Text('Next Location: ${nextLocation[0]}: ${nextLocation[2]}')
            ),
          )
        ],
      ),  
          
      );
    
  }
}