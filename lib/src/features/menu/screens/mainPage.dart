import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/profile/profile.dart';
import 'package:addies_shamiyana/src/features/menu/screens/cart/cart.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/search.dart';
import 'package:addies_shamiyana/src/features/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import 'home/home.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage(logoString),
                radius: 17,
              ),
              SizedBox(width: 8),
              Text(
                'Addies',
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),

          backgroundColor: primaryWhite,
          titleTextStyle: const TextStyle(color: primaryBlack, fontSize: 20),
          actionsIconTheme: const IconThemeData(color: primaryBlack),
          actions: [
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
                },
                iconSize: 30),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            Home(),
            Search(),
            Cart(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(),
          child: BottomNavigationBar(
            // type: BottomNavigationBarType.shifting,
            // backgroundColor: primaryGreyWhite,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Theme.of(context).primaryColorDark, // Set selected item color
            unselectedItemColor: Colors.grey[800],
          ),
        ));
  }
}

