import 'package:budget_tracker_app/Models/Category_model.dart';
import 'package:budget_tracker_app/Models/getCategory_model.dart';
import 'package:get/get.dart';

class GetCategoryController extends GetxController {
  GetCategoryModel getcategorymodel = GetCategoryModel(null);

  getAllCategory({required Future<List<CategoryModel>> categoryies}) {
    getcategorymodel.getAllCategory = categoryies;
    update();
  }
}
