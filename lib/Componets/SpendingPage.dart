import 'package:budget_tracker_app/Controllers/Spending_atributes_controller.dart';
import 'package:budget_tracker_app/Controllers/Spending_mode_contoller.dart';
import 'package:budget_tracker_app/utills/atributes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/getCategory_controller.dart';
import '../Models/Category_model.dart';

class SpendingPage extends StatefulWidget {
  const SpendingPage({super.key});

  @override
  State<SpendingPage> createState() => _SpendingPageState();
}

class _SpendingPageState extends State<SpendingPage> {
  SpendingAtributesController spendingAtributesController =
      Get.put(SpendingAtributesController());

  GetCategoryController getCategoryController =
      Get.put(GetCategoryController());

  SpendingModeController spendingModeController =
      Get.put(SpendingModeController());
  GlobalKey<FormState> spendingKey = GlobalKey<FormState>();

  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: spendingKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<SpendingAtributesController>(builder: (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: descController,
                  onSaved: (val) {
                    spendingAtributesController.getTheSpendingName(
                        descName: val!);
                  },
                  onFieldSubmitted: (_) {
                    spendingAtributesController
                        .getTheFirstSubmitField(Color(0xffff3378));
                  },
                  validator: (val) =>
                      (val!.isEmpty) ? "Enter first description" : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Description",
                    hintStyle: TextStyle(
                      color: Color(0xffa3b2c5),
                    ),
                    icon: CircleAvatar(
                      backgroundColor: spendingAtributesController
                          .spendingAtributesModel.submitField1,
                      child: Icon(
                        Icons.description,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: heigth * 0.025,
                ),
                TextFormField(
                  controller: amountController,
                  onSaved: (val) {
                    spendingAtributesController.getTheSpendingAmount(
                        amount: num.parse(val!));
                  },
                  onFieldSubmitted: (_) {
                    spendingAtributesController
                        .getTheSecondSubmitField(Color(0xffff3378));
                  },
                  validator: (val) =>
                      (val!.isEmpty) ? "Enter first Amount" : null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Amount",
                    hintStyle: TextStyle(
                      color: Color(0xffa3b2c5),
                    ),
                    icon: CircleAvatar(
                      backgroundColor: spendingAtributesController
                          .spendingAtributesModel.submitField2,
                      child: Icon(
                        Icons.currency_rupee,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: heigth * 0.025,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: spendingAtributesController
                          .spendingAtributesModel.submitField3,
                      child: Icon(
                        Icons.payments,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.035,
                    ),
                    Text(
                      "Spending Mode :",
                      style: TextStyle(
                        color: Color(0xffa3b2c5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: heigth * 0.022,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GetBuilder<SpendingModeController>(builder: (_) {
                      return Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          splashColor: (spendingModeController
                                      .spendingModeModel.online ==
                                  0)
                              ? Colors.amber.shade300
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            if (spendingModeController
                                    .spendingModeModel.online ==
                                0) {
                              spendingModeController.getTheOnline(online: 1);
                              spendingModeController.getTheOffline(offline: 0);
                              spendingAtributesController
                                  .getTheThirdSubmitField(Color(0xffff3378));
                            } else {
                              spendingModeController.getTheOnline(online: 0);
                            }

                            spendingAtributesController.getTheSpendingMode(
                                spendingMode: "ONLINE");
                          },
                          child: Container(
                            height: heigth * 0.065,
                            width: width * 0.25,
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.7,
                                  child: Opacity(
                                    opacity: (spendingModeController
                                                .spendingModeModel.online ==
                                            1)
                                        ? 1
                                        : 0.3,
                                    child: Image.asset(
                                      "assets/images/spendings/online.png",
                                      height: heigth * 0.055,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "ONLINE",
                                    style: TextStyle(
                                      color: (spendingModeController
                                                  .spendingModeModel.online ==
                                              1)
                                          ? Colors.amber
                                          : Colors.grey.shade300,
                                      fontWeight: (spendingModeController
                                                  .spendingModeModel.online ==
                                              1)
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    GetBuilder<SpendingModeController>(builder: (_) {
                      return Ink(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: InkWell(
                          splashColor: (spendingModeController
                                      .spendingModeModel.offline ==
                                  0)
                              ? Colors.amber.shade300
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            if (spendingModeController
                                    .spendingModeModel.offline ==
                                0) {
                              spendingModeController.getTheOffline(offline: 1);
                              spendingModeController.getTheOnline(online: 0);
                              spendingAtributesController
                                  .getTheThirdSubmitField(Color(0xffff3378));
                            } else {
                              spendingModeController.getTheOffline(offline: 0);
                            }
                            spendingAtributesController.getTheSpendingMode(
                                spendingMode: "OFFLINE");
                          },
                          child: Container(
                            height: heigth * 0.065,
                            width: width * 0.25,
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1,
                                  child: Opacity(
                                    opacity: (spendingModeController
                                                .spendingModeModel.offline ==
                                            1)
                                        ? 1
                                        : 0.3,
                                    child: Image.asset(
                                      "assets/images/spendings/offline.png",
                                      height: heigth * 0.05,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "OFFLINE",
                                    style: TextStyle(
                                      color: (spendingModeController
                                                  .spendingModeModel.offline ==
                                              1)
                                          ? Colors.amber
                                          : Colors.grey.shade300,
                                      fontWeight: (spendingModeController
                                                  .spendingModeModel.offline ==
                                              1)
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: heigth * 0.022,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: spendingAtributesController
                          .spendingAtributesModel.submitField4,
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(3000),
                          );
                          spendingAtributesController.getTheSpendingDate(
                              dateTime: pickedDate!);
                          spendingAtributesController
                              .getTheFourSubmitField(Color(0xffff3378));
                        },
                        child: Icon(
                          Icons.date_range,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.035,
                    ),
                    Text(
                      "Spending Date :",
                      style: TextStyle(
                        color: Color(0xffa3b2c5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.035,
                    ),
                    (spendingAtributesController.spendingAtributesModel.date ==
                            null)
                        ? Text("")
                        : Text(
                            "${spendingAtributesController.spendingAtributesModel.date!.day} / ${spendingAtributesController.spendingAtributesModel.date!.month} / ${spendingAtributesController.spendingAtributesModel.date!.year}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: heigth * 0.022,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: spendingAtributesController
                          .spendingAtributesModel.submitField5,
                      child: GestureDetector(
                        onTap: () async {
                          TimeOfDay? pickTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          spendingAtributesController.getTheSpendingTime(
                              timeOfDay: pickTime!);
                          spendingAtributesController
                              .getTheFiveSubmitField(Color(0xffff3378));
                        },
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.035,
                    ),
                    Text(
                      "Spending Time :",
                      style: TextStyle(
                        color: Color(0xffa3b2c5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.035,
                    ),
                    (spendingAtributesController.spendingAtributesModel.time ==
                            null)
                        ? Text("")
                        : Text(
                            "${spendingAtributesController.spendingAtributesModel.time!.hour} : ${spendingAtributesController.spendingAtributesModel.time!.minute}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: heigth * 0.035,
                ),
                SizedBox(
                  height: heigth,
                  width: width,
                  child: FutureBuilder(
                    future:
                        getCategoryController.getcategorymodel.getAllCategory,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "ERROR : ${snapshot.error}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                            ),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        List<CategoryModel>? data = snapshot.data;
                        return (data == null || data.isEmpty)
                            ? Center(
                                child: Text("No Categories available..."),
                              )
                            : Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                  ),
                                  itemCount: data.length,
                                  itemBuilder: (context, i) => GestureDetector(
                                    onTap: () {
                                      spendingAtributesController
                                          .getSelectedIndex(index: i);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: (spendingAtributesController
                                                      .spendingAtributesModel
                                                      .selectedIndex ==
                                                  i)
                                              ? Color(0xffff3378)
                                              : Colors.transparent,
                                          width: 1.8,
                                        ),
                                        image: DecorationImage(
                                          image: MemoryImage(
                                              data[i].categoryImage),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
