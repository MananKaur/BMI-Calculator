import 'package:flutter/material.dart';
import 'constants.dart';

class cardColumn extends StatelessWidget {
  cardColumn({@required this.iconName, @required this.gender});

  final IconData iconName;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconName,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(gender, style: kLabelTextStyle)
      ],
    );
  }
}
