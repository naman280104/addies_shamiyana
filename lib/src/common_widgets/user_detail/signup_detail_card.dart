import 'dart:async';

import 'package:addies_shamiyana/src/features/authentication/screens/signup_phone/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class detail_card extends StatelessWidget {
  const detail_card({
    super.key,
    required this.title,
    required this.icon,
    required this.type,
    this.needVerify = false,
    this.oText=false,
    required this.controllerfun,
  });
  final IconData icon;
  final String title;
  final bool needVerify;
  final TextInputType type;
  final bool oText;
  final TextEditingController controllerfun;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 260,
          height: 40,
          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
              children:[
                Icon(icon),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: controllerfun,
                    keyboardType: type,
                    obscureText:oText,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: title,
                    ),
                  ),
                ),
              ]
          ),
        ),
        const SizedBox(height: 10,),

      ],
    );
  }
}