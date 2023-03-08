import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
    return Container(
      color: primaryWhite,
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 93,),
              const Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(logoString),
                  radius: 130,

                ),
              ),
              const SizedBox(height: 117,),
              Container(
                  color: Colors.transparent,
                  child: Image(image: AssetImage(nameString,))),
            ],
          )
      ),
    );
  }
}
