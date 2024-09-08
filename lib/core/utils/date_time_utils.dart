

import 'package:intl/intl.dart';

class DateTimeUtils{

   String standartDateTimeInDriftBaseWithoutHourMinuteSecond(DateTime dateTime){
    final DateFormat dateFormat = DateFormat('dd.MM.yy');

    final result =dateFormat.format(dateTime);
    return result;
  }
}