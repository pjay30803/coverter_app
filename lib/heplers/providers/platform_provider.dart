import 'package:flutter/material.dart';

class PlatformProvider extends ChangeNotifier{
  bool isIOS=false;

  void changePlatform(){
    isIOS=!isIOS;
    notifyListeners();
  }
}