import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/signup_controller.dart';
import 'package:addies_shamiyana/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/otp_controller.dart';


class MyVerifySignup extends StatefulWidget {
  final UserModel user;
  MyVerifySignup({Key? key,required this.user}) : super(key: key);
  @override
  State<MyVerifySignup> createState() => _MyVerifySignupState();
}

class _MyVerifySignupState extends State<MyVerifySignup> {
  var otp;
  // late final UserModel user;
  // final OTPcontroller = Get.put(OTPController());
  final signupcontroller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                phoneVerify,
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                phoneverification,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                registerSignupPhone,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value){
                  otp = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      // OTPController.instance.verifyOTP(otp);
                      print(otp);
                      SignUpController.instance.verifyOTP(otp,widget.user);
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MainPage()));
                    },
                    child: Text(verifyPhoneno)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}