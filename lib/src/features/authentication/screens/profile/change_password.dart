import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text("Change Password",style: Theme.of(context).textTheme.titleLarge,),
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
            margin: EdgeInsets.fromLTRB(0, 170, 0, 0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text("Old Password"),prefixIcon: Icon(Icons.password),border: OutlineInputBorder()),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(label: Text("New Password"),prefixIcon: Icon(Icons.password),border: OutlineInputBorder()),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(label: Text("Confirm New Password"),prefixIcon: Icon(Icons.password),border: OutlineInputBorder()),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                    },
                    style: ElevatedButton.styleFrom(
                        side: BorderSide.none,
                        shape: StadiumBorder()
                    ),
                    child: Text("Change Password",style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
