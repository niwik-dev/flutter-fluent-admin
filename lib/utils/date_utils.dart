class UserDateUtils{
  static String formatDayOfWeek(DateTime dateTime){ 
    var weekday = dateTime.weekday;
    switch(weekday){
      case 1: return "星期一";
      case 2: return "星期二";
      case 3: return "星期三";
      case 4: return "星期四";
      case 5: return "星期五";
      case 6: return "星期六";
      case 7: return "星期日";
      default: return "未知";
    }
  }

  static String formatAsFuzzyDate(DateTime dateTime){
    var today = DateTime.now();
    var isSameMonth = today.year == dateTime.year && dateTime.month == today.month;
    if(isSameMonth && today.day == dateTime.day){
      return "今天";
    }
    if(isSameMonth && today.day == dateTime.day + 1){ 
      return "昨天";
    }
    if(isSameMonth && today.day == dateTime.day - 1){ 
      return "明天";
    }
    if(isSameMonth && dateTime.day - today.day < 7){
      return "7天内";
    }
    if(isSameMonth && dateTime.day - today.day < 30){
      return "30天内";
    }
    if(isSameMonth && dateTime.day - today.day < 365){ 
      return format(dateTime,format: "MM月dd日");
    }
    return "很久以前";
  }

  static String formatAsReableDay(DateTime dateTime){
    var today = DateTime.now();
    var isSameMonth = today.year == dateTime.year && dateTime.month == today.month;
    if(isSameMonth && today.day == dateTime.day){
      return "今天";
    }else if(isSameMonth && today.day == dateTime.day + 1){ 
      return "昨天";
    }else if(isSameMonth && today.day == dateTime.day - 1){ 
      return "明天";
    }
    var weekday = dateTime.weekday;
    switch(weekday){
      case 1: return "周一";
      case 2: return "周二";
      case 3: return "周三";
      case 4: return "周四";
      case 5: return "周五";
      case 6: return "周六";
      case 7: return "周日";
      default: return "";
    }
  }

  static String format(DateTime dateTime, {String format="yyyy-MM-dd"}){
    return format.replaceAll("yyyy", dateTime.year.toString())
    .replaceAll("MM", dateTime.month.toString().padLeft(2,'0'))
    .replaceAll("dd", dateTime.day.toString().padLeft(2,'0'))
    .replaceAll("HH", dateTime.hour.toString().padLeft(2,'0'))
    .replaceAll("mm", dateTime.minute.toString().padLeft(2,'0'))
    .replaceAll("ss", dateTime.second.toString().padLeft(2,'0'));
  }
}