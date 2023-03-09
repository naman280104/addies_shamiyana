import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:flutter/material.dart';

import 'below_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool popup = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          child: Text(
            "Home",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const BelowHome()



      ],
    );
  }
}
