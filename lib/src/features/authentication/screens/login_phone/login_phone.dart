import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/login_controller.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/login_phone/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 25,),
              Text(
                PhoneVer,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                registerPhone,
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: Text("+91"
                        // initialValue: "+91",
                        // keyboardType: TextInputType.number,
                        // decoration: InputDecoration(
                        //   border: InputBorder.none,
                        // ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextFormField(
                          controller: controller.phoneNo,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: phone,
                          ),
                        ))
                  ],
                ),
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
                      LoginController.instance.LogInWithPhoneNoAndOTP("+91"+controller.phoneNo.text.trim());
                      // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>MyVerify()));
                    },
                    child: Text(sendcode)),
              )
            ],
          ),
        ),
      ),
    );
  }
}