import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/repository/signUpemailFailure.dart';
import 'package:flutter_app/Authentication/screens/welcome_screen.dart';
import 'package:flutter_app/screens/api.dart';
import 'package:get/get.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

// variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const LoginScreen());
  }

  Future<void> createUserwithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailandPasswordFailure(e.code);
      print("FIREBASE WITH EXCEPTION - ${ex.message}");
      throw ex;
    } catch (_) {
      final ex = SignUpWithEmailandPasswordFailure();
      print(" EXCEPTION - ${ex.message}");
      throw ex;
    }
  }

  Future<void> loginUserwithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
  
    } catch (_) {
    
    }
  }

  Future<void> logOut() async => await _auth.signOut();
}
