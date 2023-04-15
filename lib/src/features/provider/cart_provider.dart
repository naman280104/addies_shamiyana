import 'dart:convert';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier{
  late final Map<String,int> _items = {
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
    print(_items);
    print(key);
    if(_items.containsKey(key)){
      if(_items[key]==1){
        _items.remove(key);
      }
      else{
        _items[key] = _items[key]! - 1;
      }
    }
    notifyListeners();
  }

  int totalItems() {
    return _items.values.fold(0, (a, b) => a + b);
  }

  int totalAmount() {
    int amt = 0;
    print(amt);
    print(_items);
    _items.forEach((key, value) {
      int price = ((jsonDecode(key))['price'] as int);
      print(price);
      amt+=value*price;
        print(amt);
    });
    return amt;
  }

  void removeAll(){
    var lst=[];
    _items.forEach((key, value) {
      lst.add(key);
    });
    lst.forEach((element) {
      _items.remove(element);
    });
  }
}