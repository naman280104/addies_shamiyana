import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../shared_pref.dart';

class IsUserExist{
  // static IsUserExist get instance =>Get.find();
  var _instance = FirebaseFirestore.instance;
  late var user={} ;

  Future<String> IsUserPhoneRegistererd(String phoneNo)async{
    try{
      return await _instance.collection("User")
          .where('phoneNo',isEqualTo:phoneNo)
          .get()
          .then((value){
       if(value.size!=0){
         print(value.docs[0].id);
         return "Phone No. already Registered";
       }
       else{
         String ex="true";
         return ex;
       }
      } );
    }
    catch(e){
      String msg = e.toString();
      return msg;
    }
  }


  Future<String> IsUserEmailRegistered(String email) async{
    try{
      return await _instance.collection('User')
          .where('email',isEqualTo:email)
          .get()
          .then((value){
        if(value.size!=0){
          return "Email already Registered";
        }
        else{
          String ex="true";
          return ex;
        }
      });
    }
    catch(e){
      String msg = e.toString();
      return msg;
    }
  }



  checkUserExistByEmail (email)async {
    await _instance.collection("User")
        .where('email', isEqualTo: email)
        .get()
        .then((value) {
      if (value.size != 0) {
        var docid = value.docs[0].id;
        _instance.collection("User").doc(docid)
            .get().then((DocumentSnapshot snapshot) async{
          final data = snapshot.data() as Map<String, dynamic>;
          print(data);
          user = data;
          await SharedPref.addStringToSF("User",json.encode(user));
        });
      }
    });
  }
  checkUserByPhone (phoneNo)async{
    await _instance.collection("User")
        .where('phoneNo',isEqualTo:phoneNo)
        .get()
        .then((value){
      if(value.size!=0){
        var docid = value.docs[0].id;
        _instance.collection("User").doc(docid)
            .get().then((DocumentSnapshot snapshot)async{
          final data=  snapshot.data() as Map<String,dynamic>;
          user = data;
          print(user);
          await SharedPref.addStringToSF("User",json.encode(user));
          // await getUserDetail();

        });
      }
    });
  }

  dynamic getUserDetail()async{
    user = await SharedPref.getStringValuesSF("User");
  }

  dynamic getuser()=>user;
}