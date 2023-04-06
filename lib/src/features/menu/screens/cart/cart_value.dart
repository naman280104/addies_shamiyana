import 'package:addies_shamiyana/src/features/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';

class CartValue extends StatefulWidget {

  final int value;
  const CartValue({Key? key, required this.value}) : super(key: key);

  @override
  State<CartValue> createState() => _CartValueState();
}

class _CartValueState extends State<CartValue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8FD9F0),
              Color(0xFF66EC8C) ,
            ],
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      height: 135,
      width: 360,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text('Your Total is: Rs. ${Provider.of<CartProvider>(context).totalAmount()}',
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                child: TextButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(20, 5, 20, 5)),                        backgroundColor: MaterialStateProperty.all<Color>(primaryYellow),
                        foregroundColor: MaterialStateProperty.all<Color>(primaryBlack),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        )
                    ),
                    onPressed: (){},
                    child: const Text("Pickup")
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                child: TextButton(
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20)),
                        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(20, 5, 20, 5)),
                        backgroundColor: MaterialStateProperty.all<Color>(primaryYellow),
                        foregroundColor: MaterialStateProperty.all<Color>(primaryBlack),
                        overlayColor: MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Colors.blue.withOpacity(0.04);
                            if (states.contains(MaterialState.focused) ||
                                states.contains(MaterialState.pressed))
                              return Colors.blue.withOpacity(0.12);
                            return null; // Defer to the widget's default.
                          },
                        )
                    ),

                    onPressed: (){},
                    child: const Text("Delivery")
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
