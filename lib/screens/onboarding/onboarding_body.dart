import 'package:chat_app/constants.dart';
import 'package:chat_app/screens/chat_screen.dart';
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

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 5,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(onboardingData.length,
                        (index) => buildDot(index: index)),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        },
                        child: Text("Continuar"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor)),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
          color: currentPage == index ? primaryColor : Colors.greenAccent[100],
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
