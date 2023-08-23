import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryAtributesModel {
  int? categorySelctedImage;
  ByteData? imgByteData;
  String? categoryName;
  String? categorySelcetName;
  Color? submitCategoryColor;

  CategoryAtributesModel(
    this.categorySelctedImage,
    this.imgByteData,
    this.categoryName,
    this.categorySelcetName,
    this.submitCategoryColor,
  );
}
