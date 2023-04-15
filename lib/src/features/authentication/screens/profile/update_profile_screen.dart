import 'dart:convert';

import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/login_logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
import '../../../../shared_pref.dart';
import '../../controllers/userexist.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var contr = Get.put(LoginController());
  var user;
  getuser() async{
    String User = await SharedPref.getStringValuesSF("User");
    setState(() {
      user = json.decode(User);
    });
  }
  @override
  void initState(){
    super.initState();
    getuser();
  }


  @override
  Widget build(BuildContext context) {
    if(user==null){
      return CircularProgressIndicator();
    }
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text("Your Info",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(LineAwesomeIcons.angle_left),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Column(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(logoString),
                  ),
                ),
                const SizedBox(height: 50,),
                Form(
                 child: Column(
                   children: [
                     TextFormField(
                       decoration: InputDecoration(label: Text(user["First Name"]!+" "),prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height:10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text(user["Last Name"]+" "),prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text(user["phoneNo"]!+" "),prefixIcon: Icon(Icons.phone),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text(user["email"]!+" "),prefixIcon: Icon(Icons.email),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height: 20,),
                   ],
                 )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
