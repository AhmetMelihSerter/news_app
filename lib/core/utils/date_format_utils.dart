import 'package:intl/intl.dart';

class DateFormatUtils {
  DateFormatUtils._();

  static String newsDateFormat(String date) =>
      DateFormat('dd.MM.yyyy').format(DateTime.parse(date));
}
