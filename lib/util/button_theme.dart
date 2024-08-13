import 'package:flutter/material.dart';
import 'package:flutter_app/constant/color.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();
  static final lightElevatedButtonTheme =
      ElevatedButtonThemeData( style :ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40))),
    foregroundColor: Colors.white,
    backgroundColor: tSecondaryColor,
    fixedSize: const Size(10, 20),
    side: const BorderSide(color: tSecondaryColor),
  )
  );
  static final darkElevatedButtonTheme =ElevatedButtonThemeData( 
   style : ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(40))),
    foregroundColor: tSecondaryColor,
    backgroundColor: Colors.white,
    fixedSize: const Size(10, 20),
    side: const BorderSide(color: tSecondaryColor),
  ));
}
