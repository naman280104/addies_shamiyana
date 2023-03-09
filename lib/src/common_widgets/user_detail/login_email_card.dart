import 'package:flutter/material.dart';

class LoginEmailCard extends StatelessWidget {
  const LoginEmailCard({
    super.key,
    required this.title,
    required this.icon,
    required this.type,
    this.needverify = false,
    this.oText=false,
  });

  final IconData icon;
  final String title;
  final bool needverify;
  final TextInputType type;
  final bool oText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 60,
          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
              children:[
                Icon(icon,size: 30,),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(fontSize: 20,),
                    keyboardType: type,
                    obscureText:oText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: title,
                    ),
                  ),
                ),
                needverify ? TextButton(
                    onPressed: () {},
                    child: Text("verify",style: TextStyle(color: Colors.black),)):Text("") ,


              ]
          ),
        ),
        const SizedBox(height: 10,),

      ],
    );
  }
}