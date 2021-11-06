import 'package:ecommerce/view/cart/cart.dart';
import 'package:ecommerce/view/home/home.dart';
import 'package:ecommerce/view/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget currentScreen = Home();

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          currentScreen = Home();
          break;
        }
      case 1:
        {
          currentScreen = Cart();
          break;
        }
      case 2:
        {
          currentScreen = Profile();
          break;
        }
    }
    update();
  }
}
