import 'package:flutter/material.dart';
import 'package:addies_shamiyana/src/constants/colors.dart';


class ItemCard extends StatefulWidget {

  final String name;
  Map<String, dynamic> itemInfo;
  ItemCard({Key? key, required this.name, required this.itemInfo}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 140,
        width: 350,
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
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                      width: 150,
                      child: Text(
                        widget.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      )),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 1, 0, 0),
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
                        margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                        width: 50,
                        child: Text(
                          "Rs. 35",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).shadowColor,
                              fontSize: 13),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(80, 5, 0, 0),
                        padding: EdgeInsets.all(0),
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){},
                              child: Image.asset("assets/images/Minus.png"),
                            ),
                            const SizedBox(
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

                    ],
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: 17,
                child: InkWell(
                  onTap: (){},
                  child: Image.asset("assets/images/Close.png"),
                ),
              ),

            ]
        )
    );
  }
}
