import 'package:addies_shamiyana/src/features/menu/screens/mainPage.dart';
import 'package:addies_shamiyana/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{
  static OTPController get instance=>Get.find();

  Future<bool> verifyOTP(String OTP) async{
    var isverified = await AuthenticationRepository.instance.verifyOTP(OTP);
    return isverified;
  }
}