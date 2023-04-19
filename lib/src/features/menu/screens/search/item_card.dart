import 'package:addies_shamiyana/src/features/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {

  // final String name;
  final Map<String, dynamic> itemInfo;
  const ItemCard({Key? key, required this.itemInfo}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  ValueNotifier<int> count = ValueNotifier(1);

  void addToCart(itemInfo, value) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    provider.addItem(itemInfo, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        // height: 140,
        padding: EdgeInsets.all(10),
        width: 360,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
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
                      child: Image(
                        image: AssetImage("assets/images/${widget.itemInfo['category']}.png"),
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
                          Container(
                            height: 30,
                            // width: 70,
                            margin: EdgeInsets.fromLTRB(80, 5, 0, 0),
                            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                              ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  // onTap: (){addToCart(widget.itemInfo, count.value);},
                                  onTap: () {
                                    context.read<CartProvider>().addItem(widget.itemInfo, count.value);
                                    Get.showSnackbar(GetSnackBar(message: "Added Successfully!",duration: Duration(seconds: 1),));
                                    // Get.to(const SnackBar(content: Text("Added Successfully!",style: TextStyle(color: Colors.green),),));
                                  },
                                  child: Text(
                                      'Add to Cart',
                                    style: TextStyle(
                                      color: Theme.of(context).canvasColor,
                                    ),
                                  )

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
