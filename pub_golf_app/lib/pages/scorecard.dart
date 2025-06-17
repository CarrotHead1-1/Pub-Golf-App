import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pub_golf_app/utilites/tiles/holescoretile.dart';

import '../utilites/Other/dialogboxes.dart';

class ScorecardPage extends StatefulWidget {

  final gameScorecard;

  ScorecardPage({
    super.key,
    required this.gameScorecard,
   
    
    });

  @override
  State<ScorecardPage> createState() => _ScorecardPageState();
}

class _ScorecardPageState extends State<ScorecardPage> {

  //text controller
  final controller = TextEditingController();

  //function used to add a new player
  void addNewPlayer(){
    showDialog(context: context, builder: ((context) {
      return AddPlayerBox(controller: controller, onSave: savePlayer, onCancel:() => Navigator.of(context).pop());
    
    }));
  }

  //function used to save the new player
  void savePlayer(){
    setState(() {
      //adds the player name as a key to the scorecard map
      widget.gameScorecard[controller.text] = [];
      //clear the text stored in the text controller 
      controller.clear();
    });
    
    Navigator.of(context).pop();
  }

  //function used to remove the player at an index 
  void removePlayer(int index){
    setState(() {
      String key = widget.gameScorecard.keys.elementAt(index);
      widget.gameScorecard.remove(key);
    });
    
  }

  //function used to add a score to a player
  void addNewScore(int index){
    showDialog(context: context, builder: ((context){
      return ScoreBox(controller: controller, onSave: (){saveScore(index);}, onCancel: () => Navigator.of(context).pop());
    }));
    
  }

  //function used to edit the score
  void editScore(int index, int i){
    showDialog(context: context, builder: ((context){
      return ScoreBox(controller: controller, onSave: () {saveEditedScore(index, i);}, onCancel: () => Navigator.of(context).pop());
    }));
  }


  //function used to save the edited a players score
  void saveEditedScore(int index, int i){

    setState(() {
      //temp scores list used to store the players scores 
      List scores = widget.gameScorecard.values.elementAt(index);
      scores[i] = int.parse(controller.text);
      
      //update the player scores with the scores list
      widget.gameScorecard[widget.gameScorecard.keys.elementAt(index)] = scores;
      //clear the text stored in the text controller 
      controller.clear();
    });
   

    Navigator.of(context).pop();
  }

  //save the new score 
  void saveScore(int index){
    setState(() {
      //adds the score to the correct player as an int
      widget.gameScorecard.values.elementAt(index).add(int.parse(controller.text));
      //clear the text stored in the text controller 
      controller.clear();
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Text("Scorecard"),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: addNewPlayer,
        child: Icon(Icons.add),
        ),

      body: ListView.builder(
        itemCount: widget.gameScorecard.length,
        itemBuilder:(context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Slidable(
              endActionPane: ActionPane(
                motion: StretchMotion(), 
                children: [
                  SlidableAction(
                    onPressed:(context) {removePlayer(index);},
                    backgroundColor: Colors.red.shade400,
                    icon: Icons.delete,),
                ],
                ),

              child: Expanded(
                child: Container(
                  height: 60,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(12)),
                  
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(widget.gameScorecard.keys.elementAt(index)),
                        for (int i = 0; i < widget.gameScorecard.values.elementAt(index).length; i++)
                          HoleScoreTile(
                            score: widget.gameScorecard.values.elementAt(index)[i].toString(), 
                            onPressed:() {editScore(index, i);},),
                        
                        IconButton(
                          onPressed:() {addNewScore(index);}, 
                          icon: Icon(Icons.add)),

                      ],
                    ),
                  ),
                  ),
                ), 
            ),
            );
        },),
        
    );
  }
}