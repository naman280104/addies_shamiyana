import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/category_items.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/utilities.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {

  final String categoryTitle;
  // final List<dynamic> categoryItems;
  final dynamic categoryItems;
  final dynamic subCategories;
  const CategoryTile({Key? key, required this.categoryTitle, this.subCategories, this.categoryItems}) : super(key: key);



  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {

  String getTitle() {
    return toTitleCase(widget.categoryTitle);
  }

  String getTitle_10orLess() {
    return getTitle().length > 10 ? '${getTitle().substring(0, 10)}...' : getTitle();
  }

  dynamic getItems() {
    // print(widget.categoryItems);
    return widget.categoryItems;
  }


  @override
  Widget build(BuildContext context) {

    String imgLocation = "assets/images/${widget.categoryTitle}.png";
    // String imgLocation = "assets/images/logo.png";
    // print(imgLocation);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryItems(title: getTitle(),items: getItems(),)));
      },
      child: SizedBox(
        width: 100,
        height: 150,
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryWhite,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Theme.of(context).primaryColorLight,
                  width: 4,
                ),

              ),
              child: Container(
                padding: EdgeInsets.all(10),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(20),
                //   child: const Image(image: AssetImage("assets/images/pizza.jpg"),
                //     fit: BoxFit.cover,),
                // ),
                child: Image(image: AssetImage(imgLocation),
                      fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(height: 10,),
            Text(getTitle_10orLess(),
              // overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
