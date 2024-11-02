import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:expense_tracker/core/utils/size_utils.dart';
import 'package:expense_tracker/widgets/custom_button.dart';

const String DD_MM_YYYY = 'dd/MM/yyyy';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format([String pattern = DD_MM_YYYY, String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  String fromNow() {
    var dateTime = Jiffy.parseFromDateTime(this);
    return dateTime.fromNow();
  }
}

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  DateTime? newDate = await Get.dialog<DateTime?>(Builder(builder: (context) {
    DateTime? tempDate;
    return Stack(alignment: Alignment.bottomCenter, children: [
      Positioned(
          height: 350,
          width: size.width,
          child: Container(
              height: 350,
              padding: EdgeInsets.only(bottom: 30),
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                        child: Text('取消'),
                        onPressed: () {
                          Get.back();
                        }),
                    CupertinoButton(
                        child: Text('確定'),
                        onPressed: () {
                          Get.back(result: tempDate);
                        })
                  ],
                ),
                Expanded(
                    child: StatefulBuilder(
                  builder: (_, setter) => CupertinoDatePicker(
                    initialDateTime: initialDate,
                    use24hFormat: true,
                    // This shows day of week alongside day of month
                    showDayOfWeek: true,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    // This is called when the user changes the date.
                    onDateTimeChanged: (DateTime newDate) {
                      setter.call(() => tempDate = newDate);
                    },
                  ),
                )),
              ])))
    ]);
  }), useSafeArea: false);
  // final DateTime? selectedDate = await showDatePicker(
  //   locale: Locale("zh", "HK"),
  //   initialDatePickerMode: DatePickerMode.day,
  //   initialEntryMode: DatePickerEntryMode.inputOnly,
  //   context: context,
  //   initialDate: initialDate,
  //   firstDate: firstDate,
  //   lastDate: lastDate,
  // );

  // if (selectedDate == null) return null;

  // if (!context.mounted) return selectedDate;

  // final TimeOfDay? selectedTime = await showTimePicker(
  //   context: context,
  //   initialEntryMode: TimePickerEntryMode.inputOnly,
  //   initialTime: TimeOfDay.fromDateTime(selectedDate),
  // );

  return newDate;
}
