import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  Map<int, int> _itemCount = {};
  bool _cartEmpty = true;

  // List<int> _id =

  Map<int, int> get itemCount => _itemCount;
  bool get cartEmpty => _cartEmpty;

  void reset() {
    _itemCount = {};
    _cartEmpty = true;
    notifyListeners();
  }

  void increment(id) {
    if (_itemCount.containsKey(id)) {
      _itemCount.update(id, (value) => _itemCount[id]! + 1);
      print('incrementing id: $id by 1, Count value: ${_itemCount[id]}');
    } else {
      _itemCount[id] = 1;
    }
    _cartEmpty = false;
    notifyListeners();
  }

  void decrement(id) {
    if (_itemCount.containsKey(id)) {
      if (_itemCount[id]! > 0) {
        print('decrementing id: ${id} by 1, Count value: ${_itemCount[id]!-1}');
        _itemCount.update(id, (value) => _itemCount[id]! - 1);
      }
      else{
        print('removing id: ${id} from provider map');
        itemCount.remove(id);
        _cartEmpty=true;
      }
    }else{
      print('No associated ID found');
    }
      notifyListeners();
  }
}
