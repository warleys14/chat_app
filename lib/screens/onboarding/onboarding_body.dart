import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/onboarding/onboarding_content.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> onboardingData = [
    {
      "title": "titulo de funcionalidade 1",
      "image": "assets/images/conversation-chat.png"
    },
    {
      "title": "titulo de funcionalidade 2",
      "image": "assets/images/img-chat.png"
    },
    {
      "title": "titulo de funcionalidade 3",
      "image": "assets/images/people-chat.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) => OnboardingContent(
                          image: onboardingData[index]["image"],
                          text: onboardingData[index]["title"],
                        ))),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: List.generate(onboardingData.length,
                          (index) => buildDot(index: index)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  //TODO: Finish the page indicator and button
  Container buildDot({int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(3)),
    );
  }
}
