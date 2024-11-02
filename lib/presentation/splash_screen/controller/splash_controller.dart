import 'dart:async';

// import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:expense_tracker/core/app_export.dart';
import 'package:expense_tracker/core/utils/date_time_utils.dart';
import 'package:expense_tracker/data/models/expenseModel.dart';
import 'package:expense_tracker/presentation/splash_screen/models/splash_model.dart';
import 'package:flutter/material.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dropdownController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String searchText = '';
  Rx<DateTime?> contentDatetime = Rx(null);

  final List<String> categories = [
    'Food',
    'Transport',
    'Clothes',
    'Utilities',
    'Others',
  ];
  String? dropdownValue = 'Food';

  // final List<Expense> _expenses = [];
  // final List<Expense> _searchExpenses = [];

  // List<Expense> get expenses => _expenses;
  var expenses = <Expense>[].obs;
  var searchExpenses = <Expense>[].obs;
  // List<Expense> get searchExpenses => _searchExpenses;

  void setDropdownValue(String? value) {
    print('value ${value}');
    dropdownValue = value;
    print('dropdownValue ${dropdownValue}');
  }

  void setTaskDateTime(DateTime datetime) {
    dateController?.text = datetime.format("$DD_MM_YYYY hh:mm:ss", "zh_HK");
    contentDatetime.value = datetime;
  }

  void search(String? text) {
    print('searchText ${text}');
    print('searchText ${text == ''}');
    searchExpenses.clear();
    if (text == '') {
      print('expenses ${expenses.length}');
      for (int x = 0; x < expenses.length; x++) {
        final newExpense = Expense(
            amount: amountController.text,
            description: descriptionController.text,
            category: dropdownController.text,
            date: dateController.text);
        print('newExpense ${newExpense}');
        searchExpenses.add(newExpense);
      }
    }
    for (int x = 0; x < expenses.length; x++) {
      print(
          'expenses[x].description?.contains(text!) ${expenses[x].description?.contains(text!)}');
      if (expenses[x].description?.contains(text!) ?? false) {
        final newExpense = Expense(
            amount: amountController.text,
            description: descriptionController.text,
            category: dropdownController.text,
            date: dateController.text);
        searchExpenses.add(newExpense);
      }
    }
    // dateController?.text = datetime.format("$DD_MM_YYYY hh:mm:ss", "zh_HK");
    // contentDatetime.value = datetime;
  }

  void addExpense() {
    final newExpense = Expense(
        amount: amountController.text,
        description: descriptionController.text,
        category: dropdownController.text,
        date: dateController.text);
    expenses.add(newExpense);
  }

  void removeExpense(int index) {
    print('index ${index}');
    expenses.removeAt(index);
  }

  @override
  // void onInit() {
  //   super.onInit();
  //   print("onInit");
  // }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }
}
