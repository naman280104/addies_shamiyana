import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../shared_pref.dart';



class OrderCard extends StatefulWidget {
  
  final Map<String, dynamic> orderInfo;
  const OrderCard({Key? key, required this.orderInfo}) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {

  // Timestamp timestamp = Timestamp.fromDate(DateTime.now());
  DateTime dateTime = DateTime(2023);
  String formattedDate = '';
  String formattedTime = '';
  bool showItems = false;

  // DateFormat()
  List<Widget> orderedItemsTiles = [];
  
  // print(orderInfo['itemsOrdered']);
  int totalItems = 0;
  
  @override
  void initState() {
    super.initState();
    dateTime = widget.orderInfo['orderTime'].toDate();
    formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
    formattedTime = DateFormat('HH:mm:ss').format(dateTime);

    widget.orderInfo['itemsOrdered'].forEach((key, value) {
      orderedItemsTiles.add(ListTile(
        title: Text(key.toString()),
        trailing: Text(value.toString()),
      ));
    });

    totalItems = widget.orderInfo['itemsOrdered'].values.toList().reduce((a, b) => a + b);
  }

  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          print('aagaya');
          showItems = !showItems;
        });
      },
      child: Container(
        // height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 15, 30, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(formattedDate
                ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              Text(formattedTime, style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey[500]),),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Rs. ${widget.orderInfo['amount']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green),),
                  Expanded(child: SizedBox(width: 1,)),
                  Text("Qty: ${totalItems}",style: TextStyle(color: Colors.deepOrange),),

                ],
              ),
              Visibility(
                  visible: showItems,
                  child: Column(
                    // padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                    children: orderedItemsTiles,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}



class YourOrders extends StatefulWidget {
  const YourOrders({Key? key}) : super(key: key);

  @override
  State<YourOrders> createState() => _YourOrdersState();
}

class _YourOrdersState extends State<YourOrders> {

  List<Widget> orders = [];
  List<Map<String, dynamic>> orderedInfoList = [];
  bool showItems = false;

  // Widget makeOrderCard(orderInfo) {
  //
  //   DateTime dateTime = orderInfo['orderTime'].toDate();
  //   String formattedDate = DateFormat('dd-MM-yyyy').format(dateTime);
  //   String formattedTime = DateFormat('HH:mm:ss').format(dateTime);
  //
  //   // DateFormat()
  //   List<Widget> orderedItemsTiles = [];
  //   orderInfo['itemsOrdered'].forEach((key, value) {
  //     orderedItemsTiles.add(ListTile(
  //       title: Text(key.toString()),
  //       trailing: Text(value.toString()),
  //     ));
  //   });
  //   // print(orderInfo['itemsOrdered']);
  //   int totalItems = orderInfo['itemsOrdered'].values.toList().reduce((a, b) => a + b);
  //
  //   return InkWell(
  //     onTap: (){
  //         setState(() {
  //           print('aagaya');
  //           showItems = !showItems;
  //         });
  //     },
  //     child: Container(
  //       // height: 120,
  //       width: MediaQuery.of(context).size.width,
  //       decoration: BoxDecoration(
  //           border: Border.all(color: Colors.black54),
  //           borderRadius: BorderRadius.all(Radius.circular(20))
  //       ),
  //       child: Container(
  //         padding: EdgeInsets.fromLTRB(20, 15, 30, 15),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(formattedDate
  //               ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
  //             Text(formattedTime, style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey[500]),),
  //             SizedBox(height: 10,),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 Text("Rs. ${orderInfo['amount']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green),),
  //                 Expanded(child: SizedBox(width: 1,)),
  //                 Text("Qty: ${totalItems}",style: TextStyle(color: Colors.deepOrange),),
  //
  //               ],
  //             ),
  //           Visibility(
  //               visible: showItems,
  //               child: Column(
  //                 // padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
  //                 children: orderedItemsTiles,
  //               )
  //           )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  //
  // }

  getuser() async{
    String user = await SharedPref.getStringValuesSF("User");
    return json.decode(user);
  }

  getOrders() async{
    var user = await getuser();
    print(user);
    String email_uid = user['email_uid'].toString();
    List<Map<String, dynamic>> orderInfo = [];
    final _instance = FirebaseFirestore.instance;
    
    _instance.collection('Orders')
        .where('orderedBy.email_uid', isEqualTo: user['email_uid'].toString())
        .get().then(
          (querySnapshot) {
            List<Widget> orderCards = [];
            for(var docSnapshot in querySnapshot.docs) {
              // print(docSnapshot.data());
              orderInfo.add(docSnapshot.data());
            }
            orderInfo.sort((a, b) => a['orderTime'].compareTo(b['orderTime']));
            orderInfo = orderInfo.reversed.toList();
            for(var info in orderInfo) {
              orderCards.add(OrderCard(orderInfo: info));
              orderCards.add(SizedBox(
                height: 20,
              ));
            }
            setState(() {
              orders = orderCards;
              // orderedInfoList = orderInfo;
            });
          },

          onError: (e) => print('Error ${e}'),
    );




  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text("Your Orders",style: Theme.of(context).textTheme.titleLarge,),
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
              children: orders,
            ),
          ),
        ),
      ),
    );;
  }
}
