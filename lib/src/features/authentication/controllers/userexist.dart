

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IsUserExist{
  // static IsUserExist get instance =>Get.find();
  var _instance = FirebaseFirestore.instance;


  Future<String> IsUserPhoneRegistererd(String phoneNo)async{
    try{
      return await _instance.collection("User")
          .where('phoneNo',isEqualTo:phoneNo)
          .get()
          .then((value){
       if(value.size!=0){
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

}