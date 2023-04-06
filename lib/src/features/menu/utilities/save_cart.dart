import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


void addToCart(Map<String, dynamic> itemInfo, int quantity) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? cart = prefs.containsKey('cart') ? prefs.getString('cart') : '';
  //
  // Map<dynamic, int> cartMap = jsonDecode(cart!);
  // String key1 = jsonEncode(itemInfo);
  //
  // if(cartMap.containsKey(key1)) {
  //   int? val = cartMap[key1];
  //   cartMap[key1] = val! + quantity;
  // }
  //
  // else {
  //   cartMap[key1] = quantity;
  // }
  //
  // cart = jsonEncode(cartMap);

  // prefs.setString('cart', cart);

  // print(prefs.get('cart'));

  prefs.setString('test', 'testString');

  print(prefs.get('test'));
}



