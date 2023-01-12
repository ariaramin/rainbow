import 'package:shamsi_date/shamsi_date.dart';

class Weather {
  String? country;
  String? name;
  double? lat;
  double? lon;
  int? weatherId;
  String? main;
  String? description;
  String? weatherCondition;
  int? temp;
  int? feelsLike;
  int? minTemp;
  int? maxTemp;
  int? humidity;
  int? visibility;
  int? windSpeed;
  Jalali? timestamp;
  Jalali? sunrise;
  Jalali? sunset;

  Weather({
    this.country,
    this.name,
    this.lat,
    this.lon,
    this.weatherId,
    this.main,
    this.description,
    this.weatherCondition,
    this.temp,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.humidity,
    this.visibility,
    this.windSpeed,
    this.timestamp,
    this.sunrise,
    this.sunset,
  });
}
