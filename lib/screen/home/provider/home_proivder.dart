import 'package:flutter/material.dart';
import 'package:insert_update_delete/screen/home/model/stdmodel.dart';



class HomeProvider extends ChangeNotifier
{
  List<stddata> l1 = [];

  void add(stddata s1)
  {
    l1.add(s1);
    notifyListeners();
  }

  void remove(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }

  void update(int index,stddata s1)
  {
    l1[index]=s1;
    notifyListeners();
  }
}