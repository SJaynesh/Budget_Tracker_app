import 'dart:typed_data';

class CategoryModel {
  int? categoryId;
  String categoryName;
  String categorySelectedName;
  Uint8List categoryImage;


  CategoryModel({
    this.categoryId,
    required this.categoryName,
    required this.categorySelectedName,
    required this.categoryImage,
  });

  factory CategoryModel.formMap({required Map<String, dynamic> data}) {
    return CategoryModel(
      categoryId: data['category_id'],
      categoryName: data['category_name'],
      categorySelectedName: data['category_selectName'],
      categoryImage: data['category_image'],
    );
  }
}
