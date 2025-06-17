import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;


  GeneralButton({
    super.key,
    required this.text,
    required this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),);
  }
}

class ScorecardButtons extends StatelessWidget {

final String text;
VoidCallback onPressed;

  ScorecardButtons({
    super.key,
    required this.text,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
      splashColor: Colors.red[500],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),);
      
  }
}

class NewGameButton extends StatefulWidget {

  VoidCallback onPressed;

  NewGameButton({
    super.key,
    required this.onPressed});

  @override
  State<NewGameButton> createState() => _NewGameButtonState();
}

class _NewGameButtonState extends State<NewGameButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text('Start New Game'),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14))
          ),
          
        ),
      ),
    );
  }
}