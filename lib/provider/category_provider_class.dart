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

  void setIncreaseItem(var index){

    // remenModelClass!.item++;
    // remenModelClass!.totalAmount = remenModelClass!.price! * remenModelClass!.item;

    _allDataList[index].item++;
    _allDataList[index].totalAmount = _allDataList[index].price! * _allDataList[index].item;

    // _allDataList.forEach((element) {
    //   element[index].item++;
    //   element.totalAmount = element.price! * element.item;
    // });

    // for(var i in _allDataList){
    //   i.item++;
    //   i.totalAmount = i.price! * i.item;
    // }

    // _allDataList.asMap().forEach((index, value) {
    //   value[index]!.item++;
    //   value.totalAmount = value.price! * value.item;
    // });

    // _allDataList.map((e) {
    //   e.item++;
    //   e.totalAmount = e.price! * e.item;
    // });


    notifyListeners();
  }

}