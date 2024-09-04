import 'package:flutter/material.dart';
import 'package:flutter_app/screens/api.dart';
import 'package:flutter_app/screens/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app/Authentication/repository/authentication_repo.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var email = TextEditingController();
  var password = TextEditingController();

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      // Handle successful login here
      Get.snackbar(
        'Login Successful',
        'Welcome back, ${userCredential.user?.email}',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Navigate to the appropriate screen
      Get.offAll(
          () => OnboardingScreen()); // Adjust this based on your app's flow
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions
      Get.snackbar(
        'Login Error',
        e.message ?? 'An error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // Handle any other errors
      Get.snackbar(
        'Login Error',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User aborted the sign-in
        Get.snackbar(
          'Login Error',
          'Google sign-in aborted by user.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Handle successful login here
      Get.snackbar(
        'Login Successful',
        'Welcome back, ${userCredential.user?.displayName ?? 'User'}',
        snackPosition: SnackPosition.BOTTOM,
      );
      // Navigate to the appropriate screen
      Get.offAll(
          () => OnboardingScreen()); // Adjust this based on your app's flow
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth exceptions
      Get.snackbar(
        'Login Error',
        e.message ?? 'An error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      // Handle any other errors
      Get.snackbar(
        'Login Error',
        'An unexpected error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
