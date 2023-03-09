import 'package:flutter/material.dart';


class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).primaryColorLight,
              width: 4,
            ),

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const Image(image: AssetImage("assets/images/pizza.jpg"),
              fit: BoxFit.cover,),
          ),
        ),
        const SizedBox(height: 10,),
        const Text("Pizza",
          style: TextStyle(fontSize: 15),)
      ],
    );
  }
}
