import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/Authentication/repository/authentication_repo.dart';
import 'package:flutter_app/Authentication/screens/sign_up.dart';
import 'package:flutter_app/Authentication/screens/splash_screen.dart';
import 'package:flutter_app/Authentication/screens/welcome_screen.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/Authentication/screens/login.dart';
import 'package:flutter_app/screens/splash.dart';
import 'package:flutter_app/screens/onboarding_screen.dart';
import 'package:flutter_app/util/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value)=>Get.put(AuthenticationRepo()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login Demo',
      theme: TAppTheme.lightTheme, 
       // Updated to use your custom light theme
      darkTheme: TAppTheme.darkTheme, // Custom dark theme
      themeMode: ThemeMode.system, // Automatically switch theme based on system setting
      home:  WelcomeScreen(),
    );
  }
}


