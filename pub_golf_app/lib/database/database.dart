
import 'dart:math';

import 'package:hive/hive.dart';

//class used for hive database

@HiveType(typeId: 0)
class PubGolfDatabase {

  //reference the box
  @HiveField(0)
  final pubGolfBox = Hive.box('PubGolfDatabase');
  @HiveField(1)
  List gameChallenges = [];
  @HiveField(2)
  List gameRoute = [];
  @HiveField(3)
  Map gameScorecard = {};

  void createNewGame(){

    createNewChallengeSet();
    createNewRoute();
    gameScorecard.clear();
    pubGolfBox.put("gameScorecard", gameScorecard);
  }

  void getData(){
    gameChallenges = pubGolfBox.get(gameChallenges);
    gameRoute = pubGolfBox.get(gameRoute);
    gameScorecard = pubGolfBox.get(gameScorecard);
   
  }

  void setData(){
    pubGolfBox.put("gameChallenges", gameChallenges);
    pubGolfBox.put("gameRoute", gameRoute);
    pubGolfBox.put("gameScorecard", gameScorecard);

  }

  void createNewRoute(){
    //removes previous game challenges
    gameRoute.clear();
    
    while (gameRoute.length < 9){
      int location = Random().nextInt(14);
      if (!gameRoute.contains(location)){
        gameRoute.add(location);
      }

    }
    
    pubGolfBox.put("gameRoute", gameRoute);
  }

  void createNewChallengeSet(){
    //removes previous game challenges
    gameChallenges.clear();
    
    //uses a condition controlled loop to create a set of challenges
    while (gameChallenges.length < 9){
      int challenge = Random().nextInt(15);
      //checks to see if the list is empty
      if (gameChallenges.isEmpty){
        gameChallenges.add(challenge);
      }
      else{
        gameChallenges.add(challenge);
      }
    }
    //stores data inside the database 
    pubGolfBox.put("gameChallenges", gameChallenges);
  }

  
  
}
