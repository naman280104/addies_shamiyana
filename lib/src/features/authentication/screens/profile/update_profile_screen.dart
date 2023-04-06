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
                       decoration: InputDecoration(label: Text("First Name"),prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height:10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text("Last Name"),prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text("Phone number"),prefixIcon: Icon(Icons.phone),border: OutlineInputBorder(),enabled: false),
                     ),
                     SizedBox(height: 10,),
                     TextFormField(
                       decoration: InputDecoration(label: Text("Email"),prefixIcon: Icon(Icons.email),border: OutlineInputBorder(),enabled: false),
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
