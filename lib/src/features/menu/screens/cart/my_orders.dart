import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';




class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryWhite,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("My Orders",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){

                },
                child: Container(
                  height: 120,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 30, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("27 March 2023,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                        Text("10:30 PM,",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey[500]),),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Rs. 178.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green),),
                            Expanded(child: SizedBox(width: 1,)),
                            Text("Qty: 6",style: TextStyle(color: Colors.deepOrange),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                },
                child: Container(
                  height: 120,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 15, 30, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("27 March 2023,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                        Text("10:30 PM,",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey[600]),),
                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Rs. 178.00",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.green),),
                            Expanded(child: SizedBox(width: 1,)),
                            Text("Qty: 6",style: TextStyle(color: Colors.deepOrange),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )

            ]
        ),
      ),
    );
  }
}
