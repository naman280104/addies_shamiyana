import 'dart:async';
import 'dart:convert';

import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:addies_shamiyana/src/features/authentication/controllers/login_logout_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common_widgets/profile_menu_widget.dart';
import '../../../../shared_pref.dart';
import '../loading/loading.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.put(LoginController());
  var passwd="";
  var finalUser;
  getuser() async{
    String user = await SharedPref.getStringValuesSF("User");
    setState(() {
      finalUser = json.decode(user);
    });
  }
  @override
  void initState(){
    super.initState();
    getuser();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text("Profile",style: Theme.of(context).textTheme.titleLarge,),
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
            padding: const EdgeInsets.fromLTRB(60, 40, 60, 0),
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
                const SizedBox(height: 10,),
                Text(finalUser["First Name"]+" "+finalUser["Last Name"],style: Theme.of(context).textTheme.titleLarge,),
                // Text(" ",style: Theme.of(context).textTheme.titleLarge,),
                Text(finalUser["email"],style: Theme.of(context).textTheme.titleMedium,),
                // Text(" ",style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 10,),
                const Divider(),
                const SizedBox(height: 10,),


                ProfileMenuWidget(title: "Settings", onPress: (){}, icon: LineAwesomeIcons.cog,iconcolor: Theme.of(context).primaryColor,),
                ProfileMenuWidget(title: "Your Orders", onPress: (){}, icon: LineAwesomeIcons.wallet,iconcolor: Theme.of(context).primaryColor),
                ProfileMenuWidget(title: "Your Info", onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
                }, icon: LineAwesomeIcons.info,iconcolor: Theme.of(context).primaryColor,),
                ProfileMenuWidget(title: "Logout", onPress: (){controller.logout();}, icon: LineAwesomeIcons.alternate_sign_out,endIcon: false,textColor: Colors.orange[800],iconcolor: Colors.orange[800]),
                ProfileMenuWidget(title: "Delete Account", onPress: (){
                  showCustomDisplay(context);
                }, icon: LineAwesomeIcons.remove_user,endIcon: false,textColor: Colors.red[600],iconcolor: Colors.red[600])
              ],
            ),
          ),
        ),
      ),
    );
  }
  showCustomDisplay(BuildContext context){
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Enter Password to confirm"),
                SizedBox(height: 20,),
                TextFormField(
                  onChanged: (value){
                    setState(() {
                      passwd = value;
                    });
                  },
                  decoration: InputDecoration(label: Text("Delete"),prefixIcon: Icon(Icons.delete),border: OutlineInputBorder()),
                ),
              ]
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Cancel",style: TextStyle(color: Colors.black87))),

                TextButton(onPressed: (){
                  controller.delete(passwd);
                }, child: Text("Delete",style: TextStyle(color: Colors.red)),)
              ],
            )


          ],
        ));
  }
}