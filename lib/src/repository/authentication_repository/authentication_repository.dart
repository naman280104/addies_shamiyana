import 'package:addies_shamiyana/src/features/authentication/screens/loading/loading.dart';
import 'package:addies_shamiyana/src/features/menu/screens/mainPage.dart';
import 'package:addies_shamiyana/src/repository/authentication_repository/exceptions/login_email_passsword_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'exceptions/singup_email_password_failure.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance=>Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady(){
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(()=>const Loading()):Get.offAll(()=>const MainPage());
  }


  Future<void> phoneAuthentication(String phoneNo) async{
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async{
          await _auth.signInWithCredential(credential);
        },
        codeSent: (verificationId,resendToken){
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e){
          if(e.code=='invalid-phone-number'){
            Get.snackbar('Error', 'The provided phone number is not valid.');
          } else {
            Get.snackbar('Error', 'Something went wrong. Try again!');
          }
        },
    );
  }


  Future<bool> verifyOTP(String OTP) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: OTP));
    return credentials.user != null ? true : false;
  }


  Future<void> createUserWithEmailAndPassword(String email,String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // firebaseUser.value!=null ? Get.offAll(()=>MainPage()) : Get.to(()=>Loading());
      print("here");
    }
    on FirebaseAuthException catch(e){
      final ex = SignUpWithEmailAndPaswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      // throw ex;
    }
    catch(p){
      print("in catch code");
      print(p);
      const ex = SignUpWithEmailAndPaswordFailure();
      print('EXCEPTION - ${ex.message}');
      // throw ex;
    }
  }


  Future<void> LoginWithEmailAndPassword(String email,String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.showSnackbar(GetSnackBar(message: "Login Successful",duration: Duration(seconds: 2),));
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(()=>MainPage());
      });
    }
    on FirebaseAuthException catch(e){
      final ex = LogInWithEmailAndPaswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.showSnackbar(GetSnackBar(message: ex.message,duration: Duration(seconds: 2)));

      // throw ex;
    }
    catch(p){
      print("in catch code");
      print(p);
      const ex = LogInWithEmailAndPaswordFailure();
      Get.showSnackbar(GetSnackBar(message: ex.message,duration: Duration(seconds: 2)));
      print('EXCEPTION - ${ex.message}');
      // throw ex;
    }
  }

  Future<void> logout()async{
    Get.deleteAll();
    await _auth.signOut();
  }
}