import 'package:budget_tracker_app/Controllers/BottomNavigation_controller.dart';
import 'package:budget_tracker_app/Controllers/getCategory_controller.dart';
import 'package:budget_tracker_app/Controllers/get_Category_update_value_controller.dart';
import 'package:budget_tracker_app/utills/DBHelper.dart';
import 'package:budget_tracker_app/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/Category_model.dart';

class AllCategoryPage extends StatefulWidget {
  const AllCategoryPage({super.key});

  @override
  State<AllCategoryPage> createState() => _AllCategoryPageState();
}

class _AllCategoryPageState extends State<AllCategoryPage> {
  GetCategoryController getCategoryController =
      Get.put(GetCategoryController());

  BottomNavigationController bottomNavigationController =
      Get.find<BottomNavigationController>();

  GetCategoryUpdateValueController getCategoryUpdateValueController =
      Get.put(GetCategoryUpdateValueController());

  @override
  void initState() {
    super.initState();
    getCategoryController.getAllCategory(
        categoryies: DBHelper.dbHelper.fatchAllCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (val) {
                getCategoryController.getAllCategory(
                    categoryies: DBHelper.dbHelper.fetchSearchedCategory(name: val));
              },
              decoration: InputDecoration(
                hintText: "Search here",
              ),
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: GetBuilder<GetCategoryController>(builder: (_) {
            return FutureBuilder(
              future: getCategoryController.getcategorymodel.getAllCategory,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR :${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<CategoryModel>? data = snapshot.data;

                  if (data == null || data.isEmpty) {
                    return Center(
                      child: Text("No Data Available"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: heigth * 0.035,
                            child: Image.memory(
                              data[i].categoryImage,
                              height: heigth * 0.05,
                            ),
                          ),
                          title: Text(data[i].categoryName),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Center(
                                        child: Text("UPDATE CATEGORY"),
                                      ),
                                      content: Text(
                                          "Are you sure to update this category ?"),
                                      actions: [
                                        OutlinedButton(
                                          onPressed: () async {
                                            bottomNavigationController.getSelectedIndex(val: 3);
                                            getCategoryUpdateValueController.getCategoryModel(data[i]);
                                            Get.back();
                                          },
                                          child: Text("Yes"),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("No"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: Center(
                                        child: Text("DELETE CATEGORY"),
                                      ),
                                      content: Text(
                                          "Are you sure to delete this category ?"),
                                      actions: [
                                        OutlinedButton(
                                          onPressed: () async {
                                            int res = await DBHelper.dbHelper
                                                .deleteCategory(
                                                    id: data[i].categoryId!);

                                            Get.back();

                                            if (res == 1) {
                                              getCategoryController
                                                  .getAllCategory(
                                                      categoryies: DBHelper
                                                          .dbHelper
                                                          .fatchAllCategory());

                                              Get.snackbar(
                                                "SUCCESS",
                                                "Categoey Successfull Deleted...",
                                                backgroundColor: Colors.green,
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              );
                                            } else {
                                              Get.snackbar(
                                                "FAILED",
                                                "Category Delection Failed..",
                                                backgroundColor:
                                                    Colors.redAccent,
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                              );
                                            }
                                          },
                                          child: Text("Yes"),
                                        ),
                                        OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text("No"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
