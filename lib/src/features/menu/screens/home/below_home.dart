import 'package:addies_shamiyana/src/features/menu/screens/search/category_tile.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';


class BelowHome extends StatefulWidget {
  const BelowHome({Key? key}) : super(key: key);

  @override
  State<BelowHome> createState() => _BelowHomeState();
}

class _BelowHomeState extends State<BelowHome> {
  bool popup=false;

  @override
  Widget build(BuildContext context) {
    if (!popup) {
      return Column(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 0.1,
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
                  children: [CategoryTile(categoryTitle:'Test'),CategoryTile(categoryTitle:'Test'), CategoryTile(categoryTitle:'Test')],
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
                    color: Theme.of(context).primaryColor,
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
                            child: const Text(
                              "Chocolate Cold Coffee",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            )),
                        Container(
                            margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                            width: 150,
                            child: const Text(
                              "Cold Coffee with chocolatey Taste",
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
                                    "Rs. 35",
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
                                      setState(() {
                                        popup=true;
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
    else {
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
            Container(
              margin: const EdgeInsets.fromLTRB(350,5, 0, 0),
              width: 35,
              child: InkWell(
                onTap: (){
                  setState(() {
                    popup=false;
                  });
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
      );
    }
  }
}
