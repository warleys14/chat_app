import 'package:flutter/material.dart';

import '../../constants.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Chat App",
          style: TextStyle(
              color: primaryColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(text),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 250,
          width: 250,
        )
      ],
    );
  }
}
