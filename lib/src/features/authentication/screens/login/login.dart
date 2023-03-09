import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login_email/login_email.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login_phone/login_phone.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            // Background image
            Image.asset(
              loginBackground,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            // Container widget on top of the background image
            Positioned.fill(
              child: Container(
                  color: Colors.black.withOpacity(0.7),
                  child:Column(
                    children: [
                      const SizedBox(height: 93,),
                      const Center(
                        child: CircleAvatar(
                          radius: 101,
                          backgroundColor: primaryWhite,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage(logoString),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          height: 300,
                          margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Column(

                              children:[
                                const SizedBox(height: 20,),

                                Column(
                                  children: [
                                    Text(
                                      login,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30,color: Colors.deepOrange[700]),
                                    ),
                                    const SizedBox(height: 20,),
                                    ElevatedButton.icon(
                                        style: ButtonStyle(
                                          minimumSize: MaterialStateProperty.all(Size(250, 35)), // set the size of the ElevatedButton
                                        ),
                                        onPressed: (){
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>MyPhone()));
                                        },
                                        icon: const Icon(Icons.phone),
                                        label: const Text("Continue with Mobile number",style: TextStyle(fontWeight: FontWeight.w400),)
                                    ),
                                    ElevatedButton.icon(
                                        style: ButtonStyle(
                                          minimumSize: MaterialStateProperty.all(Size(250, 35)), // set the size of the ElevatedButton
                                        ),
                                        onPressed: (){
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginEmail()));
                                        },
                                        icon: const Icon(Icons.email),
                                        label: const Text("Continue with Email",style: TextStyle(fontWeight: FontWeight.w400),)
                                    ),
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
                                      text: signinGoogle,
                                      onPressed: () {},
                                    ),
                                    Container(
                                      height: 4,
                                      width: 270,
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 2.0,
                                            color: Colors.grey,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SignUp()));
                                        // Navigate to sign up screen
                                      },
                                      child: Text(NoaccountSignup,style: TextStyle(color: Theme.of(context).primaryColorDark),),
                                    )

                                  ],
                                ),


                              ]

                          ),
                        ),
                      ),
                    ],
                  )

              ),
            ),
          ]
      ),
    );
  }
}
