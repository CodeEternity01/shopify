import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/repository/authentication_repo.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();
  final phoneNo = TextEditingController();

  // call this function from d

  void registerUser(String email, String password) {
    AuthenticationRepo.instance.createUserwithEmailandPassword(email, password);
  }
}
