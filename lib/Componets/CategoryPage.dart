import 'package:budget_tracker_app/Controllers/BottomNavigation_controller.dart';
import 'package:budget_tracker_app/Controllers/Category_atributed_controller.dart';
import 'package:budget_tracker_app/Controllers/get_Category_update_value_controller.dart';
import 'package:budget_tracker_app/Models/Category_model.dart';
import 'package:budget_tracker_app/utills/DBHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utills/atributes.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  GlobalKey<FormState> categoryKey = GlobalKey<FormState>();

  TextEditingController categoryNameController = TextEditingController();

  BottomNavigationController bottomNavigationController =
      Get.find<BottomNavigationController>();

  CategoryAtributesController categoryController =
      Get.put(CategoryAtributesController());

  GetCategoryUpdateValueController getCategoryUpdateValueController =
      Get.put(GetCategoryUpdateValueController());

  @override
  void initState() {
    super.initState();
    categoryNameController.text = (getCategoryUpdateValueController
                .categoryUpdateValueModel.updateCategory ==
            null)
        ? ""
        : getCategoryUpdateValueController
            .categoryUpdateValueModel.updateCategory!.categoryName;

    if (getCategoryUpdateValueController
            .categoryUpdateValueModel.updateCategory ==
        null) {
      categoryController.categoryAtributesModel.categorySelctedImage = null;
    } else {
      for (int i = 0; i < allCategorys.length; i++) {
        if (getCategoryUpdateValueController.categoryUpdateValueModel
                .updateCategory!.categorySelectedName ==
            allCategorys[i]['name']) {
          categoryController.categoryAtributesModel.categorySelctedImage = i;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Form(
        key: categoryKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Category",
                style: TextStyle(
                  fontSize: heigth * 0.023,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: heigth * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      allCategorys.length,
                      (i) =>
                          GetBuilder<CategoryAtributesController>(builder: (_) {
                        return GestureDetector(
                          onTap: () async {
                            categoryController.getImageByDate(
                                byteData: await rootBundle
                                    .load(allCategorys[i]['image']));

                            categoryController.getSelctedImage(i);

                            categoryController.getSelectedName(
                                name: allCategorys[i]['name']);

                          },
                          child: Container(
                            height: heigth * 0.3,
                            width: width * 0.45,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(-5, 5),
                                ),
                              ],
                              border: Border.all(
                                color: (categoryController
                                            .categoryAtributesModel
                                            .categorySelctedImage ==
                                        i)
                                    ? Color(0xffff3378)
                                    : Colors.transparent,
                                width: 2.5,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: heigth * 0.04,
                                    child: Image.asset(
                                      allCategorys[i]['image'],
                                      height: heigth * 0.06,
                                    ),
                                  ),
                                  Text(
                                    allCategorys[i]['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: heigth * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: heigth * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: heigth * 0.02,
                      ),
                      onFieldSubmitted: (val) {
                        categoryController.getColor(color: Color(0xffff3378));
                      },
                      controller: categoryNameController,
                      onSaved: (val) {
                        categoryController.getCategoryName(category_name: val!);
                      },
                      validator: (val) =>
                          (val!.isEmpty) ? "Enter Budget Name" : null,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter budget name",
                        hintStyle: TextStyle(
                          color: Color(0xffe4e5e6),
                          fontWeight: FontWeight.bold,
                          fontSize: heigth * 0.02,
                        ),
                        labelText: "Enter budget",
                        labelStyle: TextStyle(
                          color: Color(0xffced0d4),
                          fontSize: heigth * 0.018,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffced0d4),
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffced0d4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child:
                          GetBuilder<CategoryAtributesController>(builder: (_) {
                        return (getCategoryUpdateValueController
                                    .categoryUpdateValueModel.updateCategory ==
                                null)
                            ? GestureDetector(
                                onTap: () async {
                                  Uint8List imgbytes = (categoryController
                                              .categoryAtributesModel
                                              .imgByteData !=
                                          null)
                                      ? Uint8List.fromList(categoryController
                                          .categoryAtributesModel
                                          .imgByteData!
                                          .buffer
                                          .asInt8List())
                                      : Uint8List(0);

                                  if (categoryKey.currentState!.validate()) {
                                    categoryKey.currentState!.save();

                                    CategoryModel categorymodel = CategoryModel(
                                      categoryName: categoryController
                                          .categoryAtributesModel.categoryName!,
                                      categorySelectedName: categoryController
                                          .categoryAtributesModel
                                          .categorySelcetName!,
                                      categoryImage: imgbytes,
                                    );

                                    int res = await DBHelper.dbHelper
                                        .insertCategory(data: categorymodel);

                                    if (res >= 1) {
                                      Get.snackbar(
                                        "SUCCESS",
                                        "All Category id : $res Inserted Successfully...",
                                        backgroundColor: Colors.green,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else {
                                      Get.snackbar(
                                        "FAILURE",
                                        "Category Insection Failed...",
                                        backgroundColor: Colors.redAccent,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }

                                    categoryNameController.clear();

                                    categoryController.getCategoryName(
                                        category_name: "");
                                    categoryController.getSelectedName(
                                        name: "");
                                    categoryController.getSelctedImage(null);
                                    categoryController.getColor(
                                        color: Color(0xffd3d8e8));
                                  }
                                },
                                child: Container(
                                  height: heigth * 0.072,
                                  decoration: BoxDecoration(
                                    color: categoryController
                                        .categoryAtributesModel
                                        .submitCategoryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  Uint8List imgbytes = (categoryController
                                              .categoryAtributesModel
                                              .imgByteData !=
                                          null)
                                      ? Uint8List.fromList(categoryController
                                           .categoryAtributesModel
                                          .imgByteData!
                                          .buffer
                                          .asInt8List())
                                      : Uint8List(0);

                                  if (categoryKey.currentState!.validate()) {
                                    categoryKey.currentState!.save();

                                    CategoryModel categorymodel = CategoryModel(
                                      categoryName: categoryController
                                          .categoryAtributesModel.categoryName!,
                                      categorySelectedName: categoryController
                                          .categoryAtributesModel
                                          .categorySelcetName!,
                                      categoryImage: imgbytes,
                                      categoryId:
                                          getCategoryUpdateValueController
                                              .categoryUpdateValueModel
                                              .updateCategory!
                                              .categoryId,
                                    );

                                    int res = await DBHelper.dbHelper
                                        .updateCategory(data: categorymodel);

                                    if (res == 1) {
                                      Get.snackbar(
                                        "SUCCESS",
                                        "All Category Updated Successfully...",
                                        backgroundColor: Colors.green,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    } else {
                                      Get.snackbar(
                                        "FAILURE",
                                        "Category Update Failed...",
                                        backgroundColor: Colors.redAccent,
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }

                                    categoryNameController.clear();

                                    categoryController.getCategoryName(
                                        category_name: "");
                                    categoryController.getSelectedName(
                                        name: "");
                                    categoryController.getSelctedImage(null);
                                    categoryController.getColor(
                                        color: Color(0xffd3d8e8));
                                    getCategoryUpdateValueController.categoryUpdateValueModel.updateCategory =null;
                                    categoryController.categoryAtributesModel.categorySelctedImage = null;
                                  }
                                },
                                child: Container(
                                  height: heigth * 0.072,
                                  decoration: BoxDecoration(
                                    color: categoryController
                                        .categoryAtributesModel
                                        .submitCategoryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
