import 'package:flutter/material.dart';
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          LoginEmailCard(title: Eemail, icon: Icons.email, type: TextInputType.emailAddress),
          LoginEmailCard(title: Pass, icon: Icons.password, type: TextInputType.visiblePassword,oText: true),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextButton(
                  onPressed: (){},
                  child: Text(Pass,style: TextStyle(fontSize: 30))
              ),
            ),
          )
        ],
      ),
    );
  }
}

