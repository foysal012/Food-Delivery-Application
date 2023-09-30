import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/categorymodel/remen_model_class.dart';

class CategoryProviderClass with ChangeNotifier{

  RemenModelClass? remenModelClass;
  List<RemenModelClass> _allDataList = [];

  List<RemenModelClass> get allDataList => _allDataList;

  void setAddItemList(remenModelClass){
    _allDataList.add(remenModelClass);
    notifyListeners();
  }

  void setRemoveItemList(remenModelClass){

    _allDataList.remove(remenModelClass);
    notifyListeners();
  }

  void setIncreaseItem(RemenModelClass remenModelClass){

    final index = _allDataList.indexOf(remenModelClass);

    if(index != -1){
      _allDataList[index].item++;
      _allDataList[index].totalAmount = _allDataList[index].price! * _allDataList[index].item;
      notifyListeners();
    }

  }

  void setDecreaseItem(RemenModelClass remenModelClass){

    final index = _allDataList.indexOf(remenModelClass);
    if(_allDataList[index].item <= 1){

    } else {
      _allDataList[index].item--;
      _allDataList[index].totalAmount = _allDataList[index].price! * _allDataList[index].item;
      notifyListeners();
    }
  }

}