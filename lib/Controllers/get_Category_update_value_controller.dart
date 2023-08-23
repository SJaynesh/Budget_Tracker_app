import 'package:get/get.dart';

import '../Models/Category_model.dart';
import '../Models/get_Category_update_value_model.dart';

class GetCategoryUpdateValueController extends GetxController {
  GetCategoryUpdateValueModel categoryUpdateValueModel =
      GetCategoryUpdateValueModel(null);

  getCategoryModel(CategoryModel categoryModel) {
    categoryUpdateValueModel.updateCategory = categoryModel;

    update();
  }
}
