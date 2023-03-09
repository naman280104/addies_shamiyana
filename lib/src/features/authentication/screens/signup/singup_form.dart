import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/signup_phone/otp.dart';
import 'package:addies_shamiyana/src/features/menu/screens/mainPage.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/user_detail/signup_detail_card.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,color: Theme.of(context).primaryColorDark),
          ),
          const SizedBox(height: 10,),
          detail_card(title: signupFname,icon: Icons.person,type: TextInputType.name,),
          detail_card(title: signupLname,icon: Icons.person,type: TextInputType.name,),
          detail_card(title: signupPhone,icon: Icons.phone,type: TextInputType.phone,),
          detail_card(title: signupEmail,icon: Icons.email,type: TextInputType.emailAddress,),
          detail_card(title: signupPass,icon: Icons.password,type: TextInputType.visiblePassword,oText: true,),
          detail_card(title: signupCPass,icon: Icons.password,type: TextInputType.visiblePassword,oText:true,),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyVerifySignup()));
          },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40, 0, 40, 0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8),),
                ),
              ),
              child: Text(signUp,)
          ),

        ],
      ),
    );
  }
}



