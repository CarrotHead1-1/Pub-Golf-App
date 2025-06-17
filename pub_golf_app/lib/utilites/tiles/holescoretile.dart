

import 'package:flutter/cupertino.dart';
import 'package:pub_golf_app/utilites/Other/buttons.dart';

class HoleScoreTile extends StatelessWidget {

  final String score;
  VoidCallback onPressed;

  HoleScoreTile({
    super.key,
    required this.score,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.all(8)),
        Container(
          width: 40,
          height: 60,
          child: ScorecardButtons(text: score, onPressed: onPressed)
        )
        
      ],
    );
  }
}