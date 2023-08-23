import 'package:flutter/material.dart';

class SpendingAtributesModel {
  String? descName;
  num? amount;
  Color? submitField1;
  Color? submitField2;
  Color? submitField3;
  Color? submitField4;
  Color? submitField5;
  String? spendingMode;
  DateTime? date;
  TimeOfDay? time;
  int? selectedIndex;

  SpendingAtributesModel(
    this.descName,
    this.amount,
    this.submitField1,
    this.submitField2,
    this.submitField3,
    this.submitField4,
    this.submitField5,
    this.spendingMode,
    this.date,
    this.time,
    this.selectedIndex,
  );
}
