import 'package:flutter/material.dart';
import 'package:pub_golf_app/utilites/Other/buttons.dart';

class AddPlayerBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  AddPlayerBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightGreen[250],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Player",
              ),
            ),

            Row(
              children: [
                GeneralButton(text: "Add Player", onPressed: onSave,),
                GeneralButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ]),
      ),
    );
  }
}


class ScoreBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  ScoreBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightGreen[250],
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Score",
              ),
            ),

            Row(
              children: [
                GeneralButton(text: "Add Score", onPressed: onSave,),
                GeneralButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ]),
      ),
    );
  }
}