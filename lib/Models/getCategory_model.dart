import 'package:budget_tracker_app/Models/Category_model.dart';

class GetCategoryModel {
  Future<List<CategoryModel>>? getAllCategory;

  GetCategoryModel(
    this.getAllCategory,
  );
}
