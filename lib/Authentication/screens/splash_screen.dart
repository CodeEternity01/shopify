import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/screens/login.dart';
import 'package:flutter_app/Authentication/screens/welcome_screen.dart';
import 'package:flutter_app/screens/onboarding_screen.dart';

String topsplash = 'assets/bucket.png';
String bottomsplash = 'assets/men_bucket.png';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool animate = false;

  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    startAnimation();
  }

Future<void> startAnimation() async {
  await Future.delayed(const Duration(milliseconds: 300));
  if (mounted) {
    setState(() => animate = true);
  }
  _controller.forward();
  await Future.delayed(const Duration(milliseconds: 2000));
  if (mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }
}


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 30 : -60,
            left: animate ? 50 : -60,
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image(
                  image: AssetImage(topsplash),
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 300 : 200,
            left: animate ? 60 : -30,
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child:const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    // you can give any text here for splash
                    Text(
                      'Welcome Back!',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '',
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            bottom: animate ? 100 : -30,
            child: FadeTransition(
              opacity: _fadeInAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Image(
                  image: AssetImage(bottomsplash),
                  height: 400,
                  width: 400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
