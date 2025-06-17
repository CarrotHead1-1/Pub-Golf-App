// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:pub_golf_app/pages/mappage.dart';
import 'package:pub_golf_app/pages/scorecard.dart';
import 'package:pub_golf_app/utilites/tiles/challengetile.dart';
import 'package:pub_golf_app/utilites/tiles/routetile.dart';
import '../database/database.dart';
import '../utilites/Other/buttons.dart';
import '../utilites/tiles/maptile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  //open a box
  final pubGolfBox = Hive.box('PubGolfDatabase');

  //iniate the database
  PubGolfDatabase db = PubGolfDatabase();

  //iniate the state
  @override
  void initState() {
    
  
    if (pubGolfBox.get(db.gameChallenges.toString()) == null){
      db.createNewGame();
    }

    else{
      db.getData();
    }

    setLocations();

    super.initState();
  }


  //perminate game challenges
  final List challenges = [
    'Drink a pint of Beer of your choice',
    'Drink a pint of Beer and a small Wine of your choice',
    'Drink a large glass of Wine',
    'Drink 2 shots of any Spirit',
    'Drink a Double with a Mixer',
    'Drink a pint of Cider',
    'Drink a pint of Cider and a pint of Beer',
    'Drink a Passionfruit Martini',
    'Drink a Gin and Tonic',
    'Drink a Jagerbomb',
    'Drink a Aperol Spritz',
    'Drink an Esspresso Martini',
    'Drink a pint of beer and a glass of milk',
    'Drink a glass of Pimms',
    'Drink a Margarita',
    'Drink a glass of Processo',
  ];

  int currentChallengeIndex = 0;

  //updates the current challenge index and updates the state
  void nextChallenge(){
    setState(() {
      if (currentChallengeIndex + 1 < db.gameChallenges.length){
        currentChallengeIndex ++;
      }
    });
  }

  //locations List
  List locations = [
    ["The Fleet", LatLng(50.79715, -1.09329), "PO1 2PT"],
    ["The Dockyard", LatLng(50.79650, -1.09275), "PO1 2RY" ],
    ["The Guildhall Village", LatLng(50.79618, -1.09286),"PO1 2RY" ],
    ["The Liquorist", LatLng(50.79539, -1.10519), "PO1 3TD"],
    ["Slug and Lettuce", LatLng(50.79535, -1.10739), "PO1 3TR"],
    ["The Still & West, Old Portsmouth", LatLng(50.79221, -1.10939), "PO1 2JL"],
    ["Spice Island", LatLng(50.79233, -1.10916), "PO1 2JL"], 
    ["The Dolphin", LatLng(50.79021, -1.10371), "PO1 2LU"],
    ["Scarlet Tap", LatLng(50.78445, -1.08898), "PO5 3PT"],
    ["O'Neils Southsea", LatLng(50.78822, -1.08242), "PO5 2SX"],
    ["The One Eyed Dog", LatLng(50.78943, -1.08281), "PO5 1LU"],
    ["The Honest Politican ", LatLng(50.79044, -1.08873), "PO5 1JF"],
    ["The Southsea Village", LatLng(50.78407, -1.08866), "PO5 3PP"],
    ["The Wellington", LatLng(50.78949, -1.10597), "PO1 2LY"],
    ["The Pembroke", LatLng(50.78988, -1.10308), "PO1 2NR"],
  ];


  int currentLocationIndex = 0;
  var currentLocation; 
  var nextLocation; 

  //function used to set locations
    //location setter
  void setLocations(){
    //sets the current location
    currentLocation = locations[db.gameRoute[currentLocationIndex]];

    //checks if the next location is valid
    if( currentLocationIndex + 1 < db.gameRoute.length){
      //sets the next location 
      nextLocation = locations[db.gameRoute[currentLocationIndex + 1]];
    }

    else{
      //sets the next location to the current location as the route ends
      nextLocation = ["End of Route", currentLocation[1], ""];
    }
  }

  //function increments the location counter and updates the state
  void getNextLocation(){
    setState(() {
      if (currentLocationIndex + 1 < db.gameRoute.length){
        currentLocationIndex ++;
     
      }
      
      setLocations();
    });
  }

  //function decrements the location counter and updates the state
  void getLastLocation(){
    setState(() {
      if (currentLocationIndex > 0){
      currentLocationIndex --;
      
      }
      setLocations();
    });
  }
  

  


  //create new game function
  void createNewGame(){
    db.createNewGame();

    setState(() {

      currentChallengeIndex = 0;
      currentLocationIndex = 0;

      setLocations();
    
    });
    
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Main Page"),
        elevation: 0,
      ),

      //drawer used for navigation between the different app pages
      drawer: Drawer(
        backgroundColor: Colors.lightGreen[200],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.flag, size: 32,),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E  P A G E"),
              onTap:() => MainPage(),
            ),
          
            ListTile(
              leading: Icon(Icons.flag),
              title: Text("S C O R E C A R D"),
              onTap:() {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => ScorecardPage(
                    //passes all the required variables and functions to the page
                    gameScorecard: pubGolfBox.get("gameScorecard"),
                  
                    ),), 
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.map),
              title: Text("M A P  P A G E"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(builder:(context) => 
                    MapPage(
                      currentLocation: currentLocation,
                      nextLocation: nextLocation,
                      ),)
                );
                
              },
            )
          ],
        ),
      ),


      //creates the body of the main page
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          ChallengeTile(
            challenge_text: challenges[db.gameChallenges[currentChallengeIndex]], 
            counter: (currentChallengeIndex + 1).toString(), 
            onPressed: nextChallenge
            ),

          RouteTile(
            currentLocation: currentLocation[0], 
            getNextLocation: getNextLocation, 
            getLastLocation: getLastLocation,
          ),

          //Map with route to next destination on it
          MapTile(
            currentLocation: currentLocation,
            nextLocation: nextLocation,
            ),    

          //new game button used to create a new game   
          NewGameButton(onPressed: createNewGame),
        ],
      ),
    );
  }
}