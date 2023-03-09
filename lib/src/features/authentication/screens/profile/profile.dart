import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfile()));
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide.none,
                      shape: StadiumBorder()
                    ),
                    child: Text("Edit Profile",style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 30,),
                const Divider(),
                const SizedBox(height: 10,),


                ProfileMenuWidget(title: "Settings", onPress: (){}, icon: LineAwesomeIcons.cog,iconcolor: Theme.of(context).primaryColor,),
                ProfileMenuWidget(title: "Your Orders", onPress: (){}, icon: LineAwesomeIcons.wallet,iconcolor: Theme.of(context).primaryColor),
                ProfileMenuWidget(title: "Your Info", onPress: (){}, icon: LineAwesomeIcons.info,iconcolor: Theme.of(context).primaryColor,),
                ProfileMenuWidget(title: "Logout", onPress: (){}, icon: LineAwesomeIcons.alternate_sign_out,endIcon: false,textColor: Colors.orange[800],iconcolor: Colors.orange[800]),
                ProfileMenuWidget(title: "Delete Account", onPress: (){}, icon: LineAwesomeIcons.remove_user,endIcon: false,textColor: Colors.red[600],iconcolor: Colors.red[600])
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.onPress,
    required this.icon,
    required this.iconcolor,
    this.endIcon=true,
    this.textColor,
  });
  final String title;
  final bool endIcon;
  final VoidCallback onPress;
  final IconData icon;
  final Color? iconcolor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Icon(icon,color: iconcolor,),
      ),
      title: Text(title,style: Theme.of(context).textTheme.bodySmall?.apply(color: textColor),),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Icon(LineAwesomeIcons.angle_right,size:18,color: Colors.grey,),
      ):null,
    );
  }
}
