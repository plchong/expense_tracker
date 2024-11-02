import 'package:expense_tracker/core/utils/date_time_utils.dart';
import 'package:expense_tracker/presentation/splash_screen/models/splash_model.dart';
import 'package:expense_tracker/widgets/custom_text_form_field.dart';

import 'controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/app_export.dart';
import 'package:expense_tracker/widgets/textfield.dart';
import 'package:expense_tracker/widgets/dropdown.dart';
import 'package:expense_tracker/widgets/custom_button.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  @override
  Widget build(BuildContext context) {
    SplashController controller = Get.put(SplashController());

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          extendBody: true,
          body: SafeArea(
              child:
                  ListView(physics: AlwaysScrollableScrollPhysics(), children: [
            Padding(
                padding: EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 10.0, bottom: 0),
                child: Container(
                  width: size.width,
                  height: size.height,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 0, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CustomTextFormField(
                              alignment: Alignment.center,
                              topic: 'Amount',
                              focusNode: FocusNode(),
                              keyboardType: TextInputType.number,
                              controller: controller.amountController,
                              hintText: "Amount",
                              margin: getMargin(top: 8, bottom: 12),
                              variant: TextFormFieldVariant.BorderGreen,
                              padding: TextFormFieldPadding.BorderGreen,
                              validator: (value) {
                                return null;
                              }),
                          CustomTextFormField(
                              alignment: Alignment.center,
                              topic: 'Description',
                              focusNode: FocusNode(),
                              controller: controller.descriptionController,
                              hintText: "Description",
                              margin: getMargin(top: 8, bottom: 12),
                              variant: TextFormFieldVariant.BorderGreen,
                              padding: TextFormFieldPadding.BorderGreen,
                              validator: (value) {
                                return null;
                              }),
                          // CategoryDropdown(
                          //   onTap: () async {
                          //     var dateTime =
                          //         await showDateTimePicker(context: context);
                          //     if (dateTime != null)
                          //       controller.setTaskDateTime(dateTime);
                          //   },
                          // ),
                          Container(
                              width: double.infinity,
                              child: DropdownButton<String>(
                                value: controller.dropdownValue,
                                // icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style:
                                    const TextStyle(color: Colors.deepPurple),
                                onChanged: (String? value) {
                                  // controller.setDropdownValue(value)!;
                                  // controller.dropdownValue = value;
                                  controller.setDropdownValue(value);
                                },
                                items: controller.categories
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                          CustomTextFormField(
                            alignment: Alignment.center,
                            topic: 'Date',
                            onTap: () async {
                              var dateTime =
                                  await showDateTimePicker(context: context);
                              if (dateTime != null)
                                controller.setTaskDateTime(dateTime);
                            },
                            controller: controller.dateController,
                            enabled: false,
                            prefix: Icon(Icons.access_time,
                                size: 30, color: Colors.grey),
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            width: 325,
                            maxLines: 1,
                            focusNode: FocusNode(),
                            hintText: "time_placeholder".tr,
                            margin: getMargin(top: 8, bottom: 12),
                          ),
                          CustomButton(
                            variant: ButtonVariant.FillGray10001,
                            text: "Add",
                            fontStyle: ButtonFontStyle.InterSemiBold14,
                            onTap: () async {
                              controller.addExpense();
                            },
                          ),
                          CustomButton(
                            variant: ButtonVariant.FillGray10001,
                            text: "View",
                            fontStyle: ButtonFontStyle.InterSemiBold14,
                            onTap: () async {
                              _showModal(context);
                            },
                          ),
                        ],
                      )),
                ))
          ]))),
    );
  }
}

void _showModal(BuildContext context) {
  SplashController controller = Get.put(SplashController());

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Modal Title'),
        content: Container(
            width: double.maxFinite,
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (query) {
                      // setState(() {
                      //   _searchQuery = query;
                      // });
                      controller.searchText = query;
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Obx(() => controller.searchText.isEmpty
                    ? Column(
                        children:
                            controller.expenses.asMap().entries.map((entry) {
                          int index = entry.key; // Get the index
                          var e = entry.value; // Get the expense item
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: 
                                Text(e.amount ?? 'No Amount'),
                              ),
                              IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  controller.removeExpense(index);
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      )
                    : Column(
                        children: controller.searchExpenses
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key; // Get the index
                          var e = entry.value; // Get the expense item
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(e.amount ?? 'No Amount'),
                              ),
                            ],
                          );
                        }).toList(),
                      ))
              ],
            )),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusts spacing
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  controller.search(controller.searchText);
                },
                child: Text('Search'),
              ),
            ],
          ),
        ],
      );
    },
  );
}
