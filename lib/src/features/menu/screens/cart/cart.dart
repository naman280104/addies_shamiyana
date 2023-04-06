import 'dart:convert';

import 'package:addies_shamiyana/src/features/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../../../constants/colors.dart';
import 'cart_card.dart';
import 'cart_value.dart';


class Cart extends StatefulWidget {

  static String hello='';
  final dynamic cartInfo;
  const Cart({Key? key, this.cartInfo}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    ValueNotifier<int> totalitem = ValueNotifier(0);
    int totalAmount = 0;
    List<Widget> cart_card_list = [];

    List<Widget> makeCart(Map<String, int> items) {
      cart_card_list = [];
      totalAmount = 0;
      items.forEach((key, value) {
        cart_card_list.add(CartCard(itemInfo: jsonDecode(key), quantity: value));
        totalitem.value += value;
        totalAmount += (jsonDecode(key)['price'] * value) as int;
      });
      return cart_card_list;
    }

    int getAmount() => totalAmount;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          child: Text('Cart',
              style: Theme.of(context).textTheme.displayLarge
          ),
        ),
        const SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text('${Provider.of<CartProvider>(context).totalItems()} Items',
            style: TextStyle(fontSize: 15,color: primaryBlack,fontWeight: FontWeight.w500),)
        ),
        const SizedBox(height: 2,),
        Center(
          child: SizedBox(
            height: 430,
            width: 350,
            child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return ListView(
                      children: makeCart(cartProvider.items));
                },
              ),
          ),
        ),
        CartValue(value: Provider.of<CartProvider>(context).totalAmount())
      ],
    );

  }



}
