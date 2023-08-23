import 'package:budget_tracker_app/Models/BottomNavigation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  BottomNavigationModel bottomNavigationModel =
      BottomNavigationModel(selectrdIndex: 0, pageController: PageController());

  getSelectedIndex({required int val}) {
    bottomNavigationModel.selectrdIndex = val;

    bottomNavigationModel.pageController.animateToPage(
      val,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );

    update();
  }
}
