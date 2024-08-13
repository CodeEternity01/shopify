import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/controller/signupController.dart';
import 'package:flutter_app/Authentication/screens/login.dart';
import 'package:flutter_app/constant/Text.dart';
import 'package:flutter_app/constant/color.dart';
import 'package:flutter_app/constant/image.dart';
import 'package:flutter_app/constant/size.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1
              Image(
                image: const AssetImage(tWelcomeScreenImage),
                height: height * 0.2,
              ),
              const Text(
                tSingUpTilte,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const Text(
                tSignUpSubTitle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              //  section 2

              Form(
                 key: _formKey,
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: controller.fullname,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        label: Text('Full Name'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                       controller: controller.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                        label: Text('E-Mail'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                       controller: controller.phoneNo,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone_android_outlined),
                        label: Text('Phone No.'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                       controller: controller.password,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.fingerprint_outlined),
                        label: Text('PassWord'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              SignUpController.instance.registerUser(controller.email.text.trim(),controller.password.text.trim());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 50)),
                          child: Text(
                            tSignUp.toUpperCase(),
                            style: const TextStyle(fontSize: 20),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('OR'),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  fixedSize: const Size(200, 50)),
                              icon: const Image(
                                  image: AssetImage('assets/google_logo.png'),
                                  height: 20,
                                  width: 20),
                              onPressed: () {},
                              label: const Text(
                                'Sign-In With Google',
                                style: TextStyle(fontSize: 17),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              alreadyHaveAcc(context);
                            },
                            child: const Text.rich(
                              TextSpan(
                                  text: tAlreadyhaveAccount,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(245, 55, 46, 46)),
                                  children: [
                                    TextSpan(
                                        text: 'Login',
                                        style: TextStyle(color: Colors.blue))
                                  ]),
                            ))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        )),
      ),
    );
  }

  void alreadyHaveAcc(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
