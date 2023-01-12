import 'package:flutter/cupertino.dart';
import 'package:shamsi_date/shamsi_date.dart';

String timeFormater(Jalali date) {
  var hour = convertToPersianNumber(date.hour);
  var minute = date.minute < 10
      ? "۰${convertToPersianNumber(date.minute)}"
      : convertToPersianNumber(date.minute);
  return '$hour:$minute';
}

String dateFormater(Jalali date) {
  final f = date.formatter;
  return '${f.wN} ${convertToPersianNumber(int.parse(f.d))} ${f.mN}';
}

String getWeatherImage(String condition) {
  Map<String, String> hashMap = {
    "01d": "assets/images/sun.png",
    "01n": "assets/images/moon.png",
    "02d": "assets/images/sun_cloud.png",
    "02n": "assets/images/moon_cloud.png",
    "03d": "assets/images/sun_cloud.png",
    "03n": "assets/images/moon_cloud.png",
    "04d": "assets/images/clouds.png",
    "04n": "assets/images/clouds.png",
    "09d": "assets/images/rain.png",
    "09n": "assets/images/rain.png",
    "10d": "assets/images/sun_rain.png",
    "10n": "assets/images/moon_rain.png",
    "11d": "assets/images/sun_thunderstorm.png",
    "11n": "assets/images/moon_thunderstorm.png",
    "13d": "assets/images/sun_snow.png",
    "13n": "assets/images/moon_snow.png",
    "50d": "assets/images/mist.png",
    "50n": "assets/images/mist.png",
  };

  return hashMap[condition]!;
}

String convertToPersianNumber(int number) {
  String num = number.toString();
  Map<String, String> hashMap = {
    "0": "۰",
    "1": "۱",
    "2": "۲",
    "3": "۳",
    "4": "۴",
    "5": "۵",
    "6": "۶",
    "7": "۷",
    "8": "۸",
    "9": "۹",
  };

  for (var key in hashMap.keys.toList()) {
    num = num.replaceAll(key, hashMap[key]!);
  }

  return num;
}
