import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Landing/LandingPageScreen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  final List<PageViewModel> pages = [
    PageViewModel(
        image: Center(
          child: Image.asset("assets/images/Farming.jpg",fit: BoxFit.contain,),
        ),
        title: 'Welcome to Farm Kenya',
        body: 'The best e-commerce app that focuses on your farming needs.',
        // footer: ElevatedButton(
        //   onPressed: () {},
        //   child: const Text("Next"),
        // ),

        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ))),
    PageViewModel(
        title: 'Share your location',
        body: 'We are able to connect you to the nearest farmer or product buyer.',
        // footer: ElevatedButton(
        //   onPressed: () {},
        //   child: const Text("Next"),
        // ),
        image: Center(
          child: Image.asset("assets/images/share_location.jpg",fit: BoxFit.contain,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ))),
  PageViewModel(
        title: 'Upload your farm product.',
        body: 'In a few clicks, let us help you upload your farm product',
        // footer: ElevatedButton(
        //   onPressed: () {},
        //   child: const Text("Next"),
        // ),
        image: Center(
          child: Image.asset("assets/images/onBoardingOne.png",fit: BoxFit.contain,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ))),

    PageViewModel(
        title: 'Exposure throughout Kenya',
        body: 'We broadcast your farm product all over Kenya.',
        // footer: ElevatedButton(
        //   onPressed: () {},
        //   child: const Text("Next"),
        // ),
        image: Center(
          child: Image.asset("assets/images/onBoardingTwo.png",fit: BoxFit.contain,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Farm kenya"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
              size: Size(10, 10),
              color: Colors.green,
              activeSize: Size.square(12),
              activeColor: Colors.lightGreen),
          showDoneButton: true,
          done: const Text(
            "Done",
            style: TextStyle(fontSize: 18),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 18),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 20,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }
}

void onDone(context) async{
  //we will use shared preferences to store user data s as to know if it's heir first time in the app
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('ON_BOARDING', false);
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LandingPageScreen()));
}
