import 'package:flutter/material.dart';
import 'package:flutter_app/Authentication/screens/fogot_password/forgot_button.dart';
import 'package:flutter_app/Authentication/screens/fogot_password/forgot_mail.dart';
import 'package:flutter_app/Authentication/screens/fogot_password/forgot_opt_field.dart';
import 'package:flutter_app/Authentication/screens/sign_up.dart';
import 'package:flutter_app/constant/Text.dart';
import 'package:flutter_app/constant/image.dart';
import 'package:flutter_app/constant/size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                tLoginTitle,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              const Text(
                tLoginSubTitle,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
              ),

              //  section 2

              Form(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          labelText: 'E-Mail',
                          hintText: 'E-Mail',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline_outlined),
                        labelText: "PassWord",
                        hintText: 'PassWord',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.remove_red_eye),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              ForgotOptField.forgotoptionfield(context);
                            },
                            child: const Text('Forgot PassWwrd?'))),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 50)),
                          child: Text(
                            tlogin.toUpperCase(),
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
                              dontHaveAcc(context);
                            },
                            child: const Text.rich(
                              TextSpan(
                                  text: 'Dont have an Account?',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color:
                                          Color.fromARGB(245, 105, 102, 102)),
                                  children: [
                                    TextSpan(
                                        text: 'SignUp',
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

  void dontHaveAcc(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignUp()));
  }
}
