import 'package:flutter/material.dart';
import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/item_card.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/utilities.dart';


class CategoryItems extends StatefulWidget {
  final dynamic items;
  final String title;
  const CategoryItems({Key? key, required this.title, this.items}) : super(key: key);
  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {


  Map<String, List<dynamic>> subCategoryItemMap = {};

  Map<String, List<dynamic>> makeSubCategoryItemMap() {
    dynamic items = widget.items;
    subCategoryItemMap = {};

    for(int i=0; i<items.length; i++) {

      if (subCategoryItemMap.containsKey(items[i]['subCategory'])) {
        subCategoryItemMap[items[i]['subCategory']]?.add(items[i]);
      }

      else {
        subCategoryItemMap[items[i]['subCategory']] = [];
        subCategoryItemMap[items[i]['subCategory']]?.add(items[i]);
      }
    }
    subCategoryItemMap = Map.fromEntries(subCategoryItemMap.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    return subCategoryItemMap;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text(toTitleCase(widget.title), style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SubCategoryScreen(subCategoryItemMap: makeSubCategoryItemMap(),),
        ),
      ),
    );
  }
}







class SubCategoryScreen extends StatefulWidget {

  final Map<String, List<dynamic>> subCategoryItemMap;
  const SubCategoryScreen({Key? key, required this.subCategoryItemMap}) : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {

  List<ExpansionPanelRadio> subCategoryTiles = [];

  List<ExpansionPanelRadio> makeExpansionTiles() {
    Map<String, List<dynamic>> subCategoryItemMap = widget.subCategoryItemMap;
    subCategoryTiles = [];
    subCategoryItemMap.forEach((key, value) {
      List<Widget> children = value.map((e) => ItemCard(itemInfo: e)).toList();
      subCategoryTiles.add(
        ExpansionPanelRadio(
            value: key,
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(toTitleCase(key))
                );
              },
            body: Column(
                children: children,
            ),
        )
      );
    });
    return subCategoryTiles;
  }


  @override
  Widget build(BuildContext context) {

    return ExpansionPanelList.radio(
      expandedHeaderPadding: EdgeInsets.all(0.0),
      children: makeExpansionTiles(),
    );
  }
}

