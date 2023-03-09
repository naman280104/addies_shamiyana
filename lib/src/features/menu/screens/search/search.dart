import 'package:addies_shamiyana/src/common_widgets/category.dart';
import 'package:addies_shamiyana/src/constants/colors.dart';
import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
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
                                setState(() {
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
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
            SizedBox(height: 20,),
            Container(
                height: 500,
                child: ListView(
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 20.0,
                        runSpacing: 10.0,
                        children: [
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                          Category(),
                        ],
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
