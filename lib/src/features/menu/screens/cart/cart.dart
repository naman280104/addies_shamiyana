import 'dart:convert';

import 'package:addies_shamiyana/src/features/provider/cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../../constants/colors.dart';
import '../../../../shared_pref.dart';
import 'cart_card.dart';

class Cart extends StatefulWidget {
  static String hello = '';
  final dynamic cartInfo;
  const Cart({Key? key, this.cartInfo}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var _razorpay = Razorpay();

  var finalUser;
  getuser() async{
    String user = await SharedPref.getStringValuesSF("User");
    setState(() {
      finalUser = json.decode(user);
    });
  }

  orderDetailsToUpload (dynamic paymentID) async{
    var cart_items = Provider.of<CartProvider>(context,listen:false).items;
    Map<String, int> itemsInfo = {};

    cart_items.forEach((key, value) {
      itemsInfo[jsonDecode(key)['name']] = value;
    });

    Map<String, dynamic> orderDetails = {};

    orderDetails['itemsOrdered'] = itemsInfo;
    orderDetails['orderTime'] = DateTime.now();
    orderDetails['orderedBy'] = finalUser;
    orderDetails['paymentID'] = paymentID.toString();
    orderDetails['amount'] = Provider.of<CartProvider>(context,listen:false).totalAmount();

    final db = FirebaseFirestore.instance;
    db.collection("Orders")
        .add(orderDetails)
        .then((documentSnapshot) => print("Added Data with ID: ${documentSnapshot.id}"));
  }



  @override
  void initState() {
    getuser();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds

    dynamic paymentID = response.paymentId;
    orderDetailsToUpload(paymentID);
    print("Payment Successful");
    Navigator.of(context).pop();
    setState(() {});
    Provider.of<CartProvider>(context, listen: false).removeAll();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failure");
    Navigator.of(context).pop();
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {

    print("Unknown Failure");
    Navigator.of(context).pop();
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> totalitem = ValueNotifier(0);
    int totalAmount = 0;
    List<Widget> cart_card_list = [];

    List<Widget> makeCart(Map<String, int> items) {
      cart_card_list = [];
      totalAmount = 0;
      items.forEach((key, value) {
        cart_card_list
            .add(CartCard(itemInfo: jsonDecode(key), quantity: value));
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
          child: Text('Cart', style: Theme.of(context).textTheme.displayLarge),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              '${Provider.of<CartProvider>(context).totalItems()} Items',
              style: TextStyle(
                  fontSize: 15,
                  color: primaryBlack,
                  fontWeight: FontWeight.w500),
            )),
        const SizedBox(
          height: 2,
        ),
        Center(
          child: SizedBox(
            height: 430,
            width: 350,
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return ListView(children: makeCart(cartProvider.items));
              },
            ),
          ),
        ),
        CartValue(context)
      ],
    );
  }

  Container CartValue(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF8FD9F0),
                Color(0xFF66EC8C),
              ],
            ),
            borderRadius: BorderRadius.circular(10)),
        height: 135,
        width: 360,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Your Total is: Rs. ${Provider.of<CartProvider>(context).totalAmount()}',
                  //     child: Text('Your Total is: Rs. ${widget.value}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(60, 10, 0, 0),
                  child: TextButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 20)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(20, 5, 20, 5)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryYellow),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(primaryBlack),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.blue.withOpacity(0.04);
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed))
                                return Colors.blue.withOpacity(0.12);
                              return null; // Defer to the widget's default.
                            },
                          )),
                      onPressed: () {
                        showCustomDisplay(context);
                      },
                      child: const Text("Pickup")),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                  child: TextButton(
                      style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 20)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.fromLTRB(20, 5, 20, 5)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primaryYellow),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(primaryBlack),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return Colors.blue.withOpacity(0.04);
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed))
                                return Colors.blue.withOpacity(0.12);
                              return null; // Defer to the widget's default.
                            },
                          )),
                      onPressed: () {},
                      child: const Text("Delivery")),
                ),
              ],
            )
          ],
        ),
      );
  }
  @override
  void dispose(){
    _razorpay.clear();
    super.dispose();
  }
  showCustomDisplay(BuildContext context) {
    showDialog(context: context,
        builder: (context)=>AlertDialog(
          content: Text("Are you sure to continue ?"),
          actions: [
            TextButton(onPressed: (){
              var options = {
                'key': 'rzp_test_PkbndanRwjV6wD'	,
                'amount': (Provider.of<CartProvider>(context,listen:false).totalAmount()*100).toString(),
                'name': finalUser["First Name"],
                'description': 'test desc',
                'timeout':300,
                'prefill': {
                  'contact': finalUser["phoneNo"],
                  'email': finalUser["email"],
                }
              };
              _razorpay.open(options);
            }, child: Text("Pay Now")),
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Cancel"))
          ],
        ));
  }
}
