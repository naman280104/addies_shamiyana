import 'package:addies_shamiyana/src/features/authentication/controllers/userexist.dart';
import 'package:addies_shamiyana/src/features/authentication/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../../../shared_pref.dart';
import '../../menu/screens/mainPage.dart';
import '../screens/login_phone/otp.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  final otp = TextEditingController();
  final userRepo = Get.put(UserRepository());
  final authrepo = Get.put(AuthenticationRepository());
  final isuserexist = IsUserExist();

  void LogInWithEmailAndPassword(String email, String password) async {
    await AuthenticationRepository.instance
        .LoginWithEmailAndPassword(email, password);
    isuserexist.checkUserExistByEmail(email);
  }

  void LogInWithPhoneNoAndOTP(String phoneNo) async {
    String? response1 = await isuserexist.IsUserPhoneRegistererd(phoneNo);
    if (response1 == "true") {
      Get.showSnackbar(GetSnackBar(
        message: "Phone No. not registered",
        duration: Duration(seconds: 2),
      ));
    } else {
      phoneAuthentication(phoneNo);
      Get.to(() => MyVerify());
      isuserexist.checkUserByPhone(phoneNo);
    }
  }

  void phoneAuthentication(String phoneNo) {
    authrepo.phoneAuthentication(phoneNo);
  }

  void verifyOTP(String OTP) async {
    var isverified = await authrepo.verifyOTP(OTP);
    print(isverified);
    isverified ? Get.offAll(() => MainPage()) : Get.back();
  }

  void logout() async {
    await AuthenticationRepository.instance.logout();
    await SharedPref.removeValues("User");
  }

  void delete(String passwd) async {
    await AuthenticationRepository.instance.deleteUser(passwd);
  }
}
