import 'package:addies_shamiyana/src/constants/image_strings.dart';
import 'package:addies_shamiyana/src/features/authentication/screens/profile/profile.dart';
import 'package:addies_shamiyana/src/features/menu/screens/cart/cart.dart';
import 'package:addies_shamiyana/src/features/menu/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../provider/cart_provider.dart';
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
            backgroundColor: Theme.of(context).indicatorColor,
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        height: 13,
                        width: 13,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        // padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                        '${Provider.of<CartProvider>(context).totalItems()}', // Replace this with the actual number to display
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Cart',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.black, // Set selected item color
            unselectedItemColor: Colors.white70,
          ),
        ));
  }
}

