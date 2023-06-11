import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/signup/singup_form.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';

//temp fix
import './../../../../features/menu/screens/mainPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          // Background image
          Image.asset(
            signupBackground,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Container(
                          width: 300,
                          height: 500,
                          margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                          decoration: BoxDecoration(
                            color: primaryWhite,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20,),
                              SignupForm(),

                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // -----------------------BYPASS FOR TESTING-------------------------
                                  // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainPage()));
                                  // Navigate to sign up screen
                                },
                                child: Text(AlreadyHaveaccount),
                              )
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ))
        ]));
  }
}

