import 'package:intl/intl.dart';

class FormatUtils{
  static String formatNumber(int? number){
    if(number == null){
      return '0';
    }
    if(number < 1000){
      return number.toString();
    }
    if(number < 1000000){
      return '${(number/1000).toStringAsFixed(1)}K';
    }
    if(number < 1000000000){
      return '${(number/1000000).toStringAsFixed(1)}M';
    }
    return '${(number/1000000000).toStringAsFixed(1)}B';
 }

 static String timeFormatTimestamp(int timestamp){
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp*1000);
   DateFormat dateFormat;
   DateTime now = DateTime.now();
   if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day) {
     dateFormat = DateFormat('HH:mm');
   } else if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day - 1) {
     dateFormat = DateFormat('昨天HH:mm');
   }else if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day - 2) {
     dateFormat = DateFormat('前天HH:mm');
   } else if (dateTime.year == now.year && dateTime.month == now.month) {
     dateFormat = DateFormat('本月dd日 HH:mm');
   } else if (dateTime.year == now.year) {
     dateFormat = DateFormat('MM月dd日 HH:mm');
   } else if(dateTime.year == now.year-1){
     dateFormat = DateFormat('去年MM月dd日 HH:mm');
   }else if (dateTime.year < now.year-2) {
     dateFormat = DateFormat('前年MM月dd日 HH:mm');
   } else{
     dateFormat = DateFormat('yyyy年MM月dd日 HH:mm');
   }
   return dateFormat.format(dateTime);
 }

 static String dateFormatTimestamp(int timestamp){
   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp*1000);
   DateFormat dateFormat;
   DateTime now = DateTime.now();
   if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day) {
     dateFormat = DateFormat('HH:mm');
   } else if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day - 1) {
     dateFormat = DateFormat('昨天');
   }else if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day - 2) {
     dateFormat = DateFormat('前天');
   }else if (dateTime.year == now.year) {
     dateFormat = DateFormat('MM-dd');
   } else if(dateTime.year == now.year-1){
     dateFormat = DateFormat('去年');
   }else if (dateTime.year < now.year-2) {
     dateFormat = DateFormat('前年');
   } else{
     dateFormat = DateFormat('很久以前');
   }
   return dateFormat.format(dateTime);
 }
}