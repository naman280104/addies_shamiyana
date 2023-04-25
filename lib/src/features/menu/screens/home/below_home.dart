import 'package:addies_shamiyana/src/features/menu/screens/search/category_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:provider/provider.dart';

import '../../../../constants/colors.dart';
import '../../../provider/cart_provider.dart';



class PopUp extends StatefulWidget {

  final Map<String, dynamic> itemInfo;
  const PopUp({Key? key, required this.itemInfo, }) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {

  ValueNotifier<int> count = ValueNotifier(1);

  void addToCart(itemInfo, value) {
    final provider = Provider.of<CartProvider>(context, listen: false);
    provider.addItem(itemInfo, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 582,
      width:MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).splashColor,
            Theme.of(context).primaryColorLight,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(width: 1,)),
              Container(
                // margin: const EdgeInsets.fromLTRB(350, 5, 0, 0),
                width: 35,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Image.asset("assets/images/Close.png"),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),

            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Today's Special",

              style: TextStyle(fontSize: 20,color: primaryWhite),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage("assets/images/todayspecial.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    count.value > 1 ?
                    count.value -= 1: null ;},
                  child: Image.asset("assets/images/Minus.png"),
                ),
                ValueListenableBuilder(
                  valueListenable: count,
                  builder: (context, value, child) {
                    return SizedBox(
                      width: 25.0,
                      child: Text('${count.value}',
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                        // decoration: InputDecoration(
                        //   border: InputBorder.none,
                        //   contentPadding: EdgeInsets.all(0),
                        // ),
                      ),
                    );
                  },
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
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(onPressed: () {
              context.read<CartProvider>().addItem(widget.itemInfo, count.value);
              Get.showSnackbar(GetSnackBar(message: "Added Successfully!",duration: Duration(milliseconds: 500),));
              // Get.to(const SnackBar(content: Text("Added Successfully!",style: TextStyle(color: Colors.green),),));
            },
                child: Text("Add to Cart",
                  style: TextStyle(fontSize: 25),)),
          )
        ],
      ),
    );
  }
}





class BelowHome extends StatefulWidget {
  const BelowHome({Key? key}) : super(key: key);

  @override
  State<BelowHome> createState() => _BelowHomeState();
}

class _BelowHomeState extends State<BelowHome> {
  bool popup=false;

  List<String> categories = [];
  List<Widget> categoryTiles = [];
  List<dynamic> menu_ = [];
  Map<String, List<dynamic>> categoryItems = {};
  Map<String, Map<String, List<dynamic>>> subCategories = {};
  Map<String, dynamic> todaySpecial = {};


  List<Widget> makeFavCategories(List<dynamic> menu) {

    menu_ = menu;
    categories = [];
    List<Widget> categoryTiles = [];
    categoryItems = {};
    for (int i = 0; i < menu.length; i++) {
      if (categories.contains(menu[i]["category"])) {
        categoryItems[menu[i]["category"]]?.add(menu[i]);
      }
      else {
        categories.add(menu[i]["category"]);
        categoryItems[menu[i]["category"]] = [];
        categoryItems[menu[i]["category"]]?.add(menu[i]);
      }
    }


    categoryTiles.add(CategoryTile(categoryTitle: 'Garlic Breads', categoryItems: categoryItems['Garlic Breads'],));
    categoryTiles.add(CategoryTile(categoryTitle: 'Calzones', categoryItems: categoryItems['Calzones'],));
    categoryTiles.add(CategoryTile(categoryTitle: 'Drinks & Shakes', categoryItems: categoryItems['Drinks & Shakes'],));

    return categoryTiles;

  }


  List<dynamic> fetchMenu() {
    var _instance = FirebaseFirestore.instance;
    final docRef = _instance.collection("Menu").doc("FullMenu");
    docRef.get()
        .then((DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          print(data['menu'][0]);
          setState(() {
            categoryTiles = makeFavCategories(data['menu']);
          });
          // return data['menu'];
        },
        onError: (e) {
          return [{"Error": "Something1"}];
        }
    );
    return [{"Error": "Something2"}];
  }

  void fetchTodaySpecial() {
    var _instance = FirebaseFirestore.instance;
    final docRef = _instance.collection("Menu").doc("Today Special");
    docRef.get()
        .then((DocumentSnapshot doc) {
          final docData = doc.data() as Map<String, dynamic>;
          setState(() {
            todaySpecial = docData['special'];
          });
    });
  }

  // void toggleVisibility() {
  //   setState(() {
  //
  //   });
  // }



  showCustomDisplay(BuildContext context) {
    showDialog(context: context,
        builder: (context)=>AlertDialog(

          content: Container(
            // height: 582,
            // height: 400,
            // width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).splashColor,
                  Theme.of(context).primaryColorLight,
                ],
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(350,5, 0, 0),
                  width: 35,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                      // setState(() {
                      //   show=false;
                      // });
                    },
                    child: Image.asset("assets/images/Close.png"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),

                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Today's Special",
                    style: TextStyle(fontSize: 20,color: primaryWhite),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  height: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      image: AssetImage("assets/images/todayspecial.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Image.asset("assets/images/Minus.png"),
                      ),
                      SizedBox(
                        width: 25.0,
                        child: Text("1",
                          style: TextStyle(fontSize: 13),
                          textAlign: TextAlign.center,
                          // decoration: InputDecoration(
                          //   border: InputBorder.none,
                          //   contentPadding: EdgeInsets.all(0),
                          // ),
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Image.asset("assets/images/Plus.png"),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ElevatedButton(onPressed: (){},
                      child: Text("Add to Cart",
                        style: TextStyle(fontSize: 25),)),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    fetchMenu();
    fetchTodaySpecial();
  }



  @override
  Widget build(BuildContext context) {
    print('build home page');

    if (categoryTiles != [] && todaySpecial != {}) {
      return Column(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 0.1,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(37, 5, 37, 5),
                  child: const Text(
                    "Most Loved Categories",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: categoryTiles,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 0.1,
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(75, 5, 75, 5),
                  child: const Text(
                    "Today's Special",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).primaryColorLight,
                    width: 0.1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Theme.of(context).primaryColorLight,
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
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 20, 0, 0),
                            width: 150,
                            child: Text(
                              todaySpecial['name'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            width: 150,
                            child: Text(
                              todaySpecial['description'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12),
                            )),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.fromLTRB(
                                      15, 30, 0, 0),
                                  width: 50,
                                  child: Text(
                                    'Rs. ${todaySpecial['price']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColorDark,
                                        fontSize: 13),
                                  )),
                              Container(
                                height: 25,
                                width: 80,
                                margin: const EdgeInsets.fromLTRB(30, 23, 0, 0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                    ),
                                    onPressed: () {
                                      // PopupSpecial();
                                      // setState(() {
                                      //   popup=true;
                                      // });
                                      // Navigator.of(context).push(showCustomDisplay(context));
                                      // showCustomDisplay(context);
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return PopUp(itemInfo: todaySpecial,);
                                          });
                                    },
                                    child: const Text(
                                      "Add to Cart",
                                      style: TextStyle(fontSize: 13),
                                    )),
                              ),
                            ]),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      );
    }
    // else if(popup){
    //   return PopUp();
    // }
    else {
      return CircularProgressIndicator();
    }
  }
}
