import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/signup_controller.dart';
import 'package:addies_shamiyana/src/features/authentication/models/user_model.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/signup_phone/otp.dart';
import 'package:addies_shamiyana/src/features/menu/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/user_detail/signup_detail_card.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key? key
  }) : super(key: key);
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

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
          detail_card(title: signupFname,icon: Icons.person,type: TextInputType.name,controllerfun: controller.firstName,),
          detail_card(title: signupLname,icon: Icons.person,type: TextInputType.name,controllerfun: controller.lastName,),
          detail_card(title: signupPhone,icon: Icons.phone,type: TextInputType.phone,controllerfun: controller.phoneNo,),
          detail_card(title: signupEmail,icon: Icons.email,type: TextInputType.emailAddress,controllerfun: controller.email,),
          detail_card(title: signupPass,icon: Icons.password,type: TextInputType.visiblePassword,oText: true,controllerfun: controller.password,),
          detail_card(title: signupCPass,icon: Icons.password,type: TextInputType.visiblePassword,oText:true,controllerfun: controller.passwordConfirm,),
          ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()){
              // SignUpController.instance.registerUserbyemail(controller.email.text.trim(), controller.password.text.trim());
              // SignUpController.instance.phoneAuthentication("+91"+controller.phoneNo.text.trim());
              final user = UserModel(
                fName: controller.firstName.text.trim(),
                lName: controller.lastName.text.trim(),
                phoneNo: controller.phoneNo.text.trim(),
                email: controller.email.text.trim(),
                password: controller.password.text.trim(),
              );
              SignUpController.instance.CreateUser(user);
            }
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyVerifySignup()));
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



