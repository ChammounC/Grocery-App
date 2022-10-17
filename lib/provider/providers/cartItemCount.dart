import 'package:flutter/material.dart';


class CartItem with ChangeNotifier{

  List<int> _itemCount = List.filled(10, 0);
  bool _cartEmpty = true;

  List<int> get itemCount => _itemCount;
  bool get cartEmpty => _cartEmpty;

  void reset(){
    _itemCount = List.filled(10, 0);
    _cartEmpty = true;
    notifyListeners();
  }

  void increment(index){
    _itemCount[index]++;
    _cartEmpty = false;
    notifyListeners();
  }
  void decrement(index){
    if(_itemCount[index]>0) {
      _itemCount[index]--;
      if(!_itemCount.contains(0)){
        _cartEmpty = false;
      }else{
        _cartEmpty=true;
        for(int i in _itemCount){
          if(i != 0){
            _cartEmpty=false;
          }
        }
      }
      notifyListeners();
    }
  }
}