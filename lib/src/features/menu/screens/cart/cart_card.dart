import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:flutter/material.dart';


class CartCard extends StatefulWidget {

  final Map<String, dynamic> itemInfo;
  final int quantity;
  const CartCard({Key? key, required this.itemInfo, required this.quantity}) : super(key: key);
  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  ValueNotifier<int> count = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    count.value = widget.quantity;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        // height: 140,
        padding: EdgeInsets.all(10),
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              primaryYellow,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).secondaryHeaderColor,
                        width: 0.1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Image(
                        image: AssetImage("assets/images/todayspecial.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      width: 150,
                      child: Text(
                        widget.itemInfo['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 1, 0, 0),
                      width: 150,
                      child: Text(
                        widget.itemInfo['description'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 50,
                        child: Text(
                          widget.itemInfo.containsKey('price') ? 'Rs. ${widget.itemInfo['price']}' : 'Rs. 300',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).shadowColor,
                              fontSize: 13),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(80, 10, 0, 0),
                            padding: EdgeInsets.all(0),
                            height: 20,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: (){
                                    count.value > 1 ?
                                    count.value -= 1: null ;},
                                  child: Image.asset("assets/images/Minus.png"),
                                ),
                                SizedBox(
                                  width: 25.0,
                                  child: ValueListenableBuilder(
                                      valueListenable: count,
                                      builder: (context, value, child)  {
                                        return Text('${count.value}',
                                          style: TextStyle(fontSize: 13),
                                          textAlign: TextAlign.center,
                                        );
                                      }),
                                ),
                                InkWell(
                                  onTap: (){
                                    count.value < 9 ?
                                    count.value += 1 : null;},
                                  child: Image.asset("assets/images/Plus.png"),
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),

                    ],
                  ),

                ],
              ),
            ]
        )
    );
  }
}
