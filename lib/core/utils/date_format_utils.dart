import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatUtils {
  DateFormatUtils._();

  static String newsDateFormat(String? date) {
    if (date == null) {
      return '';
    }
    debugPrint('Date: $date');
    final formattedDate = DateFormat('dd.MM.yyyy').format(DateTime.parse(date));
    return formattedDate;
  }
}
