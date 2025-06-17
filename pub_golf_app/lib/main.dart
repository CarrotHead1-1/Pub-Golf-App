import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pub_golf_app/database/database.dart';
import 'package:pub_golf_app/pages/mainpage.dart';


void main() async{

  //initate Hive database 
  await Hive.initFlutter();
 
  //open a database box
  var pubGolfBox = await Hive.openBox('PubGolfDatabase');

  //run the flutter app
  runApp(pubGolfApp());

}


class pubGolfApp extends StatelessWidget {
  const pubGolfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen),  



    );
  }
}