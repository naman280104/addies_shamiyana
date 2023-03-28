import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import './menu_data_temp.dart';
import './category_tile.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  // List<Map<String, dynamic>> menu = finalMenu;
  List<String> categories = [];
  List<Widget> categoryTiles = [];
  List<dynamic> menu = [];
  Map<String, List<dynamic>> categoryItems = {};

  Map<String, Map<String, List<dynamic>>> subCategories = {};

  // Map<> subCategories = {};

  // void makeSubCategories() {
  //   for (int i = 0; i < menu.length; i++) {
  //     dynamic item = menu[i];
  //
  //     if (subCategories.containsKey(item["category"])) {
  //       if (subCategories[item["category"]]?.containsKey(item["subCategory"]) != nullzz) {
  //         subCategories[item["category"]][item["subCategory"]].add(item);
  //       }
  //       else {
  //         subCategories[item["category"]][item["subCategory"]] = [];
  //         subCategories[item["category"]][item["subCategory"]].add(item);
  //       }
  //     }
  //     else {
  //       subCategories[item["category"]] = {};
  //       subCategories[item["category"]][item["subCategory"]] = [];
  //       subCategories[item["category"]][item["subCategory"]].add(item);
  //     }
  //   }
  // }


  List<Widget> makeCategories(List<dynamic> menu) {
    // List<dynamic> menu = fetchMenu();
    // print("make cat");
    // print(menu);
    categories = [];
    categoryTiles = [];
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
    // print(categories);

    for (int i = 0; i < categories.length; i += 3) {
      Widget w1 = i < categories.length
          ? CategoryTile(categoryTitle: categories[i], categoryItems: categoryItems[categories[i]],)
          : const SizedBox(height: 100, width: 100);
      Widget w2 = i + 1 < categories.length
          ? CategoryTile(categoryTitle: categories[i+1], categoryItems: categoryItems[categories[i+1]],)
          : const SizedBox(height: 100, width: 100);
      Widget w3 = i + 2 < categories.length
          ? CategoryTile(categoryTitle: categories[i+2], categoryItems: categoryItems[categories[i+2]],)
          : const SizedBox(height: 100, width: 100);
      categoryTiles.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [w1, w2, w3],
      ));
    }
    return categoryTiles;

    // makeSubCategories();
  }









  List<dynamic> fetchMenu() {
    var _instance = FirebaseFirestore.instance;
    // print("In fetch");
    final docRef = _instance.collection("Menu").doc("FullMenu");
    // print(docRef);
    docRef.get().then(
            (DocumentSnapshot doc) {
          // print("then");
          // final data = doc.data() as Map<String, List<Map<String, dynamic>>>;
          final data = doc.data() as Map<String, dynamic>;
          // print(data['menu']);
          setState(() {
            // menu = data['menu'];
            categoryTiles = makeCategories(data['menu']);
          });
          return data['menu'];
        },
        onError: (e) {
          // print("Error getting document: $e");
          return [{"Error": "Something1"}];
        }
    );
    return [{"Error": "Something2"}];
  }



  @override
  Widget build(BuildContext context) {

    // makeCategories();
    fetchMenu();

    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text("Browse",
                  style: Theme.of(context).textTheme.displayLarge
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 40, 5),
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 2, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Builder(
                          builder: (context) {
                            return TextFormField(
                              onTap:(){

                              },
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                  fontSize: 20
                              ),
                            );
                          }
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        // Perform search
                      },
                      splashRadius: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
                height: 500,
                child: ListView(
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 10.0,
                        children: categoryTiles,
                      ),
                    ),
                  ],
                )
            )

          ]
      ),
    );
  }
}
