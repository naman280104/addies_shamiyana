import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import 'cart_card.dart';
import 'cart_value.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    const totalitem=3;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          child: Text("Cart",
              style: Theme.of(context).textTheme.displayLarge
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: const Text("$totalitem items",
            style: TextStyle(fontSize: 15,color: primaryBlack,fontWeight: FontWeight.w500),),
        ),
        const SizedBox(height: 2,),
        Center(
          child: SizedBox(
            height: 430,
            width: 350,
            child: ListView(
              children: const [
                CartCard(),
                CartCard(),
                CartCard(),
                CartCard(),
                CartCard(),
                CartCard(),
              ],
            ),
          ),
        ),
        const CartValue()



      ],
    );
  }
}
