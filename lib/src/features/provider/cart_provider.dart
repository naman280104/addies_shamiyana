import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';


class CartProvider extends ChangeNotifier{

  final Map<String,int> _items = {
    // jsonEncode({
    //   "name": "PERI PERI FRIES",
    //   "description": "",
    //   "category": "Nibbles",
    //   "subCategory": "items",
    //   "price": 89
    // }) : 2,
    //
    // jsonEncode({
    //   "name": "AMERICAN CLUB SANDWICH",
    //   "description": "(Fresh Vegetables with Baked Beans, Creamy Mayonnaise Sauce & More)",
    //   "category": "Grilled Sandwiches",
    //   "subCategory": "Veg",
    //   "price": 120
    // }) : 3,

  };

  Map<String,int> get items => _items;
  
  void addItem(Map<String, dynamic> itemInfo, int value){

    itemInfo = Map.fromEntries(itemInfo.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    String key = jsonEncode(itemInfo);
    if(_items.containsKey(key)) {
      _items[key] = _items[key]! + value;
    }
    else {
      _items[key] = value;
    }
    notifyListeners();
  }

  void reduceItem(Map<String, dynamic> itemInfo) {
    itemInfo = Map.fromEntries(itemInfo.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    String key = jsonEncode(itemInfo);
    if(_items.containsKey(key)) {
      _items[key] = _items[itemInfo]! - 1;
      notifyListeners();
    }
    notifyListeners();
  }

  int totalItems() {
    return _items.values.fold(0, (a, b) => a + b);
  }

  int totalAmount() {
    int amt = 0;
    _items.entries.map((e) => amt += (e.value) * (jsonDecode(e.key))['price'] as int);
    return amt;
  }

}