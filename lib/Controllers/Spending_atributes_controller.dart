import 'package:budget_tracker_app/Models/Spending_atributes_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpendingAtributesController extends GetxController {
  SpendingAtributesModel spendingAtributesModel = SpendingAtributesModel(
    null,
    null,
    Color(0xffd3d8e8),
    Color(0xffd3d8e8),
    Color(0xffd3d8e8),
    Color(0xffd3d8e8),
    Color(0xffd3d8e8),
    null,
    null,
    null,
    null,
  );

  getTheSpendingName({required String descName}) {
    spendingAtributesModel.descName = descName;

    update();
  }

  getTheSpendingAmount({required num amount}) {
    spendingAtributesModel.amount = amount;

    update();
  }

  getTheFirstSubmitField(
    Color? submitField1,
  ) {
    spendingAtributesModel.submitField1 = submitField1;
    update();
  }

  getTheSecondSubmitField(
    Color? submitField2,
  ) {
    spendingAtributesModel.submitField2 = submitField2;
    update();
  }

  getTheThirdSubmitField(
    Color? submitField3,
  ) {
    spendingAtributesModel.submitField3 = submitField3;
    update();
  }

  getTheFourSubmitField(
    Color? submitField4,
  ) {
    spendingAtributesModel.submitField4 = submitField4;
    update();
  }

  getTheFiveSubmitField(
    Color? submitField5,
  ) {
    spendingAtributesModel.submitField5 = submitField5;
    update();
  }

  getTheSpendingMode({required String spendingMode}) {
    spendingAtributesModel.spendingMode = spendingMode;
    update();
  }

  getTheSpendingDate({required DateTime dateTime}) {
    spendingAtributesModel.date = dateTime;
    update();
  }

  getTheSpendingTime({required TimeOfDay timeOfDay}) {
    spendingAtributesModel.time = timeOfDay;
    update();
  }

  getSelectedIndex({required int index}) {
    spendingAtributesModel.selectedIndex = index;
    update();
  }
}
