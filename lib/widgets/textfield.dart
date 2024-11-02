import 'package:expense_tracker/core/app_export.dart';
import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield({this.keyboardType, this.title, this.controller});
  final TextInputType? keyboardType;
  final String? title;
  final TextEditingController? controller;

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: title,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () {
          //     // Handle button press
          //     final enteredValue = _controller.text;
          //     print('Entered value: $enteredValue');
          //   },
          //   child: Text('Submit'),
          // ),
        ],
      ),
    );
  }
}
