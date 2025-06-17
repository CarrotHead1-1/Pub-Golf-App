import 'package:flutter/material.dart';

class ChallengeTile extends StatefulWidget {

  //variables 
  final String challenge_text;
  final String counter;
  VoidCallback onPressed;

  ChallengeTile({
    super.key,
    required this.challenge_text,
    required this.counter,
    required this.onPressed
    });

  @override
  State<ChallengeTile> createState() => _ChallengeTileState();
}

class _ChallengeTileState extends State<ChallengeTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 100,
        width: 500,
        padding: EdgeInsets.only(left: 12),
        child: Row(
          children: [
            Container(
              width: 100,
              child: Text("Challenge  " + widget.counter),
            ),

            Expanded(
              child: Text(widget.challenge_text),
              ),
            
            Container(
              //make the icon button visable and invisable depending on the challenge number
              width: 50,
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: widget.onPressed,
                
              ),
            )
          ],
        ),

        decoration: BoxDecoration(
          color: Colors.lightGreen[300],
          borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}