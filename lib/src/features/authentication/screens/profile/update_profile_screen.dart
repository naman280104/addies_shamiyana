import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';


class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text("Edit Profile",style: Theme.of(context).textTheme.titleLarge,),
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
                       decoration: InputDecoration(label: Text("First Name"),prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder()),
                     ),
                     SizedBox(height:10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text("Last Name"),prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder()),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text("Phone number"),prefixIcon: Icon(Icons.phone),border: OutlineInputBorder()),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text("Email"),prefixIcon: Icon(Icons.email),border: OutlineInputBorder()),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       obscureText: true,
                       decoration: InputDecoration(label: Text("Password"),prefixIcon: Icon(Icons.password),border: OutlineInputBorder()),
                     ),
                     SizedBox(height: 20,),
                     SizedBox(
                       width: 200,
                       height: 50,
                       child: ElevatedButton(
                         onPressed: (){Navigator.pop(context);},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Theme.of(context).primaryColor, side: BorderSide.none,shape:const StadiumBorder()
                         ),
                         child: Text("Edit Profile",style: TextStyle(color: primaryBlack),),
                       ),
                     )

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
