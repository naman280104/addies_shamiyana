import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login_email/login_email_form.dart';
import 'package:flutter/material.dart';


class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
        width: double.infinity,
        height: double.infinity,
        color: primaryWhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(welcome,style: Theme.of(context).textTheme.displaySmall,),
                Text(ABC,style: Theme.of(context).textTheme.displayMedium,),
                SizedBox(height: 70,),
                Text(ContEmail),
                SizedBox(height: 5,),
                LoginEmailForm(formKey: _formKey)
              ],
            ),
      ),
    );
  }
}
