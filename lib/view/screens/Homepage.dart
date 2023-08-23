import 'package:budget_tracker_app/Componets/AllCategoryPage.dart';
import 'package:budget_tracker_app/Componets/AllSpendingPage.dart';
import 'package:budget_tracker_app/Componets/CategoryPage.dart';
import 'package:budget_tracker_app/Componets/SpendingPage.dart';
import 'package:budget_tracker_app/Controllers/BottomNavigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Budget Tracker app"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex:
              bottomNavigationController.bottomNavigationModel.selectrdIndex,
          onDestinationSelected: (val) {
            bottomNavigationController.getSelectedIndex(val: val);
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.money), label: "All Spending"),
            NavigationDestination(
                icon: Icon(Icons.incomplete_circle), label: "Spending"),
            NavigationDestination(
                icon: Icon(Icons.category), label: "All Category"),
            NavigationDestination(
                icon: Icon(Icons.category_outlined), label: "Category"),
          ],
        ),
        body: PageView(
          controller:
              bottomNavigationController.bottomNavigationModel.pageController,
          onPageChanged: (val) {
            bottomNavigationController.getSelectedIndex(val: val);
          },
          children: [
            AllSpendingPage(),
            SpendingPage(),
            AllCategoryPage(),
            CategoryPage(),
          ],
        ),
        backgroundColor: Color(0xfff3f5f7),
      );
    });
  }
}
