import 'package:flutter/material.dart';
import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/item_card.dart';


class CategoryItems extends StatefulWidget {
  final dynamic items;
  final String title;
  const CategoryItems({Key? key, required this.title, this.items}) : super(key: key);
  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {


  Map<String, List<dynamic>> subCategoryItemMap = {};
  List<Widget> itemsCardList = [];

  List<Widget> makeSubCategoryItemMap() {
    dynamic items = widget.items;

    for(int i=0; i<items.length; i++) {
      itemsCardList.add(ItemCard(name: items[i]['name'], itemInfo: items[i],));
    }

    return itemsCardList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: AppBar(
        backgroundColor: primaryWhite,
        title: Text(widget.title, style: Theme.of(context).textTheme.titleLarge,),
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
          child: Column(
            // children: [
            //   Container(width: 20, height: 20,color: Colors.deepOrange,),
            //   Container(width: 20, height: 20,color: Colors.amber,),
            //   Container(width: 20, height: 20,color: Colors.red,),
            // ],
            children: makeSubCategoryItemMap(),
          )
        ),
      ),
    );
  }
}
