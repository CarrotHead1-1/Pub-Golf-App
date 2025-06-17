import 'package:flutter/material.dart';




class RouteTile extends StatelessWidget {

  final String currentLocation;
  VoidCallback getNextLocation;
  VoidCallback getLastLocation;


  RouteTile({
    super.key,
    required this.currentLocation,
    required this.getNextLocation,
    required this.getLastLocation,S
    
    });

  @override
  Widget build(BuildContext context) {

    

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 100,
        width: 500,
        padding: EdgeInsets.only(left: 12),

        decoration: BoxDecoration(
          color: Colors.lightGreen[300],
          borderRadius: BorderRadius.circular(20)
        ),

        child: Row(
          children: [
            Visibility(
              visible: true,
              child: Container(
              width: 75,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: getLastLocation,
              ),
            ),
            ),

            Expanded(
              child: Center(
              child: Text(currentLocation),
              ),
              ),
            
            Visibility(
              visible: true,
              child: Container(
                //make the icon button visable and invisable depending on the challenge number
                width: 75,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: getNextLocation,
                ),
                
              ),
            )
          ],
        ),

      ),
    );
  }
}