import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/screens/login.dart';
import 'package:flutter_app/Authentication/screens/sign_up.dart';
import 'package:flutter_app/constant/Text.dart';
import 'package:flutter_app/constant/color.dart';
import 'package:flutter_app/constant/image.dart';
import 'package:flutter_app/constant/size.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image section
            Image.asset(
              tWelcomeScreenImage,
              height: size.height * 0.55,
            ),

            const SizedBox(height: 20),

            // Text section
            const Text(
              "Welcome to Virtual Garden",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Discover plants, grow your garden, and deepen your love for botany with interactive guides and care tips.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 30),

            // Button section
            // Button section
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          toLogin(context);
                        },
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))),
                          foregroundColor:  const Color(0xFF618867),
                          backgroundColor: Colors.white,
                          fixedSize: const Size(10, 20),
                          side: const BorderSide(color: tSecondaryColor),
                        ),
                        child: Text(tlogin.toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19)))),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    toSignUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF618867),
                    fixedSize: const Size(10, 20),
                    side: const BorderSide(color: tSecondaryColor),
                  ),
                  child: Text(tsignup.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19)),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }

  void toLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  void toSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }
}
