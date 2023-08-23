import 'dart:typed_data';

import 'package:budget_tracker_app/Models/Category_atributes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryAtributesController extends GetxController{

  CategoryAtributesModel categoryAtributesModel = CategoryAtributesModel(null, null, null, null, Color(0xffd3d8e8));

  getSelctedImage(val) {
    categoryAtributesModel.categorySelctedImage = val;

    update();
  }

  getSelectedName({required String name}) {
    categoryAtributesModel.categorySelcetName = name;

    update();
  }

  getColor({required Color color}) {
    categoryAtributesModel.submitCategoryColor = color;

    update();
  }

  getCategoryName({required String category_name}) {
    categoryAtributesModel.categoryName = category_name;

    update();
  }

  getImageByDate({required ByteData byteData}) {
    categoryAtributesModel.imgByteData = byteData;
    update();
  }

}