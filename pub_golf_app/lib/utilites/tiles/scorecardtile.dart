import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pub_golf_app/utilites/tiles/holescoretile.dart';




class ScorecardTile extends StatefulWidget {

  Map game_scorecard; 
  Function(int) addNewScore;
  Function(int) removePlayer;
  Function(int, int) editScore;
  

  ScorecardTile({
    super.key,
    required this.game_scorecard,
    required this.addNewScore,
    required this.removePlayer,
    required this.editScore,
    });

  @override
  State<ScorecardTile> createState() => _ScorecardTileState();
}

class _ScorecardTileState extends State<ScorecardTile> {


  @override
  Widget build(BuildContext context) {
    
        return ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: widget.game_scorecard.length,
          itemBuilder: (context, index) {
            
            return Padding(
              padding: EdgeInsets.all(10),
              child: Slidable(
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed:(context) {widget.removePlayer(index);},
                      backgroundColor: Colors.red.shade400,
                      icon: Icons.delete, 
                    ),
                  ],
                ),
                child: Expanded(
                  child: Container(
                    padding: EdgeInsets.all(8),
                height: 60,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blue[300],
                ),
                //creates a horizontal scroll view so all scores can be displayed beyond the screen boundarys
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(widget.game_scorecard.keys.elementAt(index)),
                      for (int i = 0; i < widget.game_scorecard.values.elementAt(index).length; i++)
                        HoleScoreTile(score: widget.game_scorecard.values.elementAt(index)[i].toString(), onPressed:() {widget.editScore(index, i);},),

                      IconButton(
                        onPressed: (){widget.addNewScore(index);},
                        icon: Icon(Icons.add))
                    ],
                    ) ),
                  ),
              ),
            ),
        );
      },
    );
         
  }
}