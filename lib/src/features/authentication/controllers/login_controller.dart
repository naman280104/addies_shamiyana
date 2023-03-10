
import 'package:addies_shamiyana/src/features/authentication/controllers/userexist.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../../menu/screens/mainPage.dart';

class LoginController extends GetxController{
  static LoginController get instance =>Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final userRepo = Get.put(UserRepository());
  final authrepo = Get.put(AuthenticationRepository());
  final isuserexist = IsUserExist();

  void LogInWithEmailAndPassword(String email,String password)async{
    String? error = await AuthenticationRepository.instance.LoginWithEmailAndPassword(email, password) as String?;
    // print("Error is "+error!);
    // if(error!=null){
    //   print("error"+error);
    //   Get.showSnackbar(GetSnackBar(message: error.toString(),duration: Duration(seconds: 2)));
    // }
    // else{
    //   Get.showSnackbar(GetSnackBar(message: "Login Successful",duration: Duration(seconds: 2),));
    //   Future.delayed(const Duration(seconds: 2), () {
    //     Get.offAll(()=>MainPage());
    //   });

    // }
  }
}