import 'package:expense_tracker/core/app_export.dart';
import 'package:expense_tracker/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  CategoryDropdown({this.onTap});

  String? selectedCategory;

  // Function(SelectionPopupModel)? onChanged;
  // Function? onChanged;
  Function? onTap;

  final List<String> categories = [
    'Food',
    'Transport',
    'Clothes',
    'Utilities',
    'Others',
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = categories.first;
    return Container(
        width: double.infinity,
        child: DropdownButton<String>(
          value: dropdownValue,
          // icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          // underline: Container(
          //   height: 2,
          //   color: Colors.black,
          // ),
          onChanged: (value) {
            onTap!(value);
          },
          // onChanged: (String changedValue) {
          //       newValue=changedValue;
          //       setState(() {
          //         newValue;
          //       });
          //     },
          items: categories.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
