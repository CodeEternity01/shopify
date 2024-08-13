import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/screens/login.dart';
import 'package:flutter_app/Authentication/screens/sign_up.dart';
import 'package:flutter_app/constant/Text.dart';
import 'package:flutter_app/constant/color.dart';
import 'package:flutter_app/constant/image.dart';
import 'package:flutter_app/constant/size.dart';
import 'package:get/get.dart';

import 'package:http/http.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Three section first image second text and in third we give a button for login and signup
            Image(
              image: AssetImage(tWelcomeScreenImage),
              height: height * 0.55,
            ),

            const Column(children: [
              Text(
                tWelcomeTitle,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              Text(
                tWelcomeSubTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ]),

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
                    foregroundColor:  tSecondaryColor,
                    backgroundColor:  Colors.white,
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
                    backgroundColor: tSecondaryColor,
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
