import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/screens/welcome_screen.dart';
import 'package:flutter_app/component/onboarding_page.dart';
import 'package:flutter_app/Authentication/screens/login.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final LiquidController liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LiquidSwipe(
        pages: [
          OnboardingPage(
            image: Image.asset("assets/all_grocery.png"),
            title: "Welcome",
            description:
                "Welcome to the best online grocery store. Here you will find all the groceries in one place.",
            noOfScreen: 3,
            onNextPressed: () => liquidController.animateToPage(page: 1),
            currentScreenNo: 0,
            showSkipButton: true,
            showNextButton: true,
            onSkipPressed: () => openHomeScreen(context),
          ),
          OnboardingPage(
            image: Image.asset("assets/grocery.png"),
            title: "Fresh Fruits & Vegetables",
            description:
                "Buy farm fresh fruits & vegetables online at the best & affordable prices.",
            noOfScreen: 3,
            onNextPressed: () => liquidController.animateToPage(page: 2),
            currentScreenNo: 1,
            showSkipButton: true,
            showNextButton: true,
            onSkipPressed: () => openHomeScreen(context),
          ),
          OnboardingPage(
            image: Image.asset("assets/delivery.png"),
            title: "Quick & Fast Delivery",
            description:
                "We offer speedy delivery of your groceries, bathroom supplies, baby care products, pet care items, stationary, etc. within 30 minutes at your doorstep.",
            noOfScreen: 3,
            onNextPressed: () => openHomeScreen(context),
            currentScreenNo: 2,
            showGetStartedButton: true,
          ),
        ],
        liquidController: liquidController,
        enableLoop: false,
        slideIconWidget: const Icon(Icons.arrow_back_ios),
        positionSlideIcon: 0.8,
        fullTransitionValue: 400,
        waveType: WaveType.liquidReveal,
        onPageChangeCallback: (page) {
          // Optionally handle page changes here
        },
      ),
    );
  }

  void openHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>const WelcomeScreen()),
    );
  }
}