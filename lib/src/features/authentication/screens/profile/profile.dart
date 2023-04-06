import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/profile/change_password.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:addies_shamiyana/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/profile_menu_widget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final authrepo = Get.put(AuthenticationRepository());
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
                Text("Full Name",style: Theme.of(context).textTheme.titleLarge,),
                Text("email@example.com",style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      shape: StadiumBorder()
                    ),
                    child: Text("Change Password",style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 10,),
                const Divider(),
                const SizedBox(height: 10,),


                ProfileMenuWidget(title: "Settings", onPress: (){}, icon: LineAwesomeIcons.cog,iconcolor: Theme.of(context).primaryColor,),
                ProfileMenuWidget(title: "Your Orders", onPress: (){}, icon: LineAwesomeIcons.wallet,iconcolor: Theme.of(context).primaryColor),
                ProfileMenuWidget(title: "Your Info", onPress: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
                }, icon: LineAwesomeIcons.info,iconcolor: Theme.of(context).primaryColor,),
                ProfileMenuWidget(title: "Logout", onPress: (){authrepo.logout();}, icon: LineAwesomeIcons.alternate_sign_out,endIcon: false,textColor: Colors.orange[800],iconcolor: Colors.orange[800]),
                ProfileMenuWidget(title: "Delete Account", onPress: (){authrepo.deleteUser();}, icon: LineAwesomeIcons.remove_user,endIcon: false,textColor: Colors.red[600],iconcolor: Colors.red[600])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
