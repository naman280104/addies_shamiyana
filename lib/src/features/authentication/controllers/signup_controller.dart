
import 'dart:convert';

import 'package:addies_shamiyana/src/constants/text_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/otp_controller.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/userexist.dart';
import 'package:addies_shamiyana/src/features/authentication/models/user_model.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/signup/signup.dart';
import 'package:addies_shamiyana/src/features/menu/screens/mainPage.dart';
import 'package:addies_shamiyana/src/repository/authentication_repository/authentication_repository.dart';
import 'package:addies_shamiyana/src/repository/user_repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../shared_pref.dart';
import '../screens/signup_phone/otp.dart';

class SignUpController extends GetxController{
  static SignUpController get instance =>Get.find();


  //Text field controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNo = TextEditingController();
  final userRepo = Get.put(UserRepository());
  final authrepo = Get.put(AuthenticationRepository());
  final isuserexist = IsUserExist();
  final _auth = FirebaseAuth.instance;


  void registerUserbyemail(String email,String password, UserModel user)async{
    String? error = await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if(error!=null){

      Get.showSnackbar(GetSnackBar(message: error.toString(),));
    }
    else{
      user.email_uid = _auth.currentUser?.uid;
      print(_auth.currentUser?.uid);
      userRepo.createUser(user);
      await SharedPref.addStringToSF("User",json.encode(user));
      Get.offAll(()=>MainPage());
    }
  }


  void verifyOTP(String OTP,UserModel user) async{
    var isverified = await authrepo.verifyOTP(OTP);
    user.phone_uid = _auth.currentUser?.uid;
    isverified ? registerUserbyemail(user.email, user.password,user): Get.back();
  }


  Future<void> CreateUser(UserModel user)async{
    String?response1 = await isuserexist.IsUserPhoneRegistererd(user.phoneNo);
    if(response1=="true"){
      String?response2 = await isuserexist.IsUserEmailRegistered(user.email);
      if(response2=="true"){
        phoneAuthentication(user.phoneNo);
        Get.to(()=>MyVerifySignup(user:user));
      }
      else{

        print(response2+"here email");
        Get.showSnackbar(GetSnackBar(message: response2.toString(),duration: Duration(seconds: 2),));
        // CreateUser(user);

      }
    }
    else{
      print(response1+"here phone");
      Get.showSnackbar(GetSnackBar(message: response1.toString(),duration: Duration(seconds: 2),));
      // CreateUser(user);

    }


  }

  void phoneAuthentication(String phoneNo){
    authrepo.phoneAuthentication(phoneNo);
  }



}
