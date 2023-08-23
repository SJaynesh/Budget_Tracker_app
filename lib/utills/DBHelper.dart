import 'dart:typed_data';

import 'package:budget_tracker_app/Models/Category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  Future initDB() async {
    String dbLoaction = await getDatabasesPath();

    String path = join(dbLoaction, "sarkar.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        String query =
            "CREATE TABLE category(category_id INTEGER PRIMARY KEY AUTOINCREMENT, category_name TEXT NOT NULL, category_selectName TEXT NOT NULL,category_image BLOB);";

        await db.execute(query);
      },
    );
  }

  Future<int> insertCategory({required CategoryModel data}) async {
    await initDB();

    String query =
        "INSERT INTO category(category_name,category_selectName,category_image)VALUES(?,?,?)";
    List args = [
      data.categoryName,
      data.categorySelectedName,
      data.categoryImage
    ];

    int res = await db!.rawInsert(query, args);

    return res;
  }

  Future<List<CategoryModel>> fatchAllCategory() async {
    await initDB();

    String query = "SELECT * FROM category;";

    List<Map<String, dynamic>> res =
        await db!.rawQuery(query); // return List<Map<String,dynamic>>

    List<CategoryModel> AllCategory =
        res.map((e) => CategoryModel.formMap(data: e)).toList();

    return AllCategory;
  }

  Future<int> deleteCategory({required int id}) async {
    await initDB();

    String query = "DELETE FROM category WHERE category_id = ?;";
    List args = [id];

    int res = await db!
        .rawDelete(query, args); // return's total no. of delete record's count

    return res;
  }

  Future<int> updateCategory({required CategoryModel data}) async {
    await initDB();

    String query =
        "UPDATE category SET category_name = ? , category_selectName = ? , category_image = ?  WHERE category_id = ?;";
    List args = [
      data.categoryName,
      data.categorySelectedName,
      data.categoryImage,
      data.categoryId
    ];

    int res = await db!
        .rawUpdate(query, args); // return's total no. of update record's count
    return res;
  }

  Future<List<CategoryModel>> fetchSearchedCategory(
      {required String name}) async {
    await initDB();

    String query = "SELECT * FROM category WHERE category_name LIKE '%$name%'";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<CategoryModel> SearchCategory =
        res.map((e) => CategoryModel.formMap(data: e)).toList();

    return SearchCategory;
  }
}
