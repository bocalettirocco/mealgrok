class Time {

  static DateTime beginning(DateTime now) {
    var beginning = now
      .subtract(Duration(hours: now.hour))
      .subtract(Duration(minutes: now.minute))
      .subtract(Duration(seconds: now.second))
      .subtract(Duration(milliseconds: now.millisecond))
      .subtract(Duration(microseconds: now.microsecond));
    return beginning;
  } 

  static DateTime end(DateTime now) {
    var end = now
      .add(Duration(hours: 23 - now.hour))
      .add(Duration(minutes: 59 - now.minute))
      .add(Duration(seconds: 59 - now.second))
      .add(Duration(milliseconds: 999 - now.millisecond))
      .add(Duration(microseconds: 999 - now.microsecond));
    return end;
  }
  
}