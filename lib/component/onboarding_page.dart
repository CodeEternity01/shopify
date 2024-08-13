import 'package:flutter/material.dart';
import 'package:flutter_app/component/rounded_button.dart';

class OnboardingPage extends StatelessWidget {
  final Image image;
  final String title;
  final String description;
  final int noOfScreen;
  final VoidCallback onNextPressed;
  final int currentScreenNo;
  final bool showSkipButton;
  final bool showNextButton;
  final bool showGetStartedButton;
  final VoidCallback? onSkipPressed;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.noOfScreen,
    required this.onNextPressed,
    required this.currentScreenNo,
    this.showSkipButton = false,
    this.showNextButton = false,
    this.showGetStartedButton = false,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
         const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          if (showSkipButton)
            RoundedButton(
              title: 'Skip',
              onPressed: onSkipPressed ?? () {},
            ),
          if (showNextButton)
            RoundedButton(
              title: 'Next',
              onPressed: onNextPressed,
            ),
          if (showGetStartedButton)
            SizedBox(
              width: double.infinity,
              child: RoundedButton(          
                title: 'Get Started',
                onPressed: onNextPressed,
              ),
            ),
        ],
      ),
    );
  }
}
