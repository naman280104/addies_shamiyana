import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/signup/singup_form.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          // Background image
          Image.asset(
            signupBackground,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
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
                  height: 550,
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
                       SignupForm(formKey: _formKey),
                       Row(
                         children: const [
                           Expanded(child: Divider()),
                           Padding(
                             padding: EdgeInsets.symmetric(horizontal: 16),
                             child: Text("or"),
                           ),
                           Expanded(child: Divider()),
                         ],
                       ),
                       SignInButton(
                         Buttons.Google,
                         text: signupGoogle,
                         onPressed: () {},
                       ),
                       TextButton(
                         onPressed: () {
                           Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Login()));
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
