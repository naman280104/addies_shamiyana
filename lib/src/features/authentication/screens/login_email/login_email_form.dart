import 'package:addies_shamiyana/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widgets/user_detail/login_email_card.dart';
import '../../../../constants/text_strings.dart';

class LoginEmailForm extends StatelessWidget {
  const LoginEmailForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          LoginEmailCard(title: Eemail, icon: Icons.email, type: TextInputType.emailAddress,controllerfun: controller.email,),
          LoginEmailCard(title: Pass, icon: Icons.password, type: TextInputType.visiblePassword,oText: true,controllerfun: controller.password,),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      // SignUpController.instance.registerUserbyemail(controller.email.text.trim(), controller.password.text.trim());
                      // SignUpController.instance.phoneAuthentication("+91"+controller.phoneNo.text.trim());

                      LoginController.instance.LogInWithEmailAndPassword(controller.email.text.trim(), controller.password.text.trim());
                    }
                  },
                  child: Text(login,style: TextStyle(fontSize: 30))
              ),
            ),
          )
        ],
      ),
    );
  }
}

