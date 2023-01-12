import 'package:rainbow/home/domain/entity/weather.dart';
import 'package:shamsi_date/shamsi_date.dart';

class WeatherResponse {
  int? id;
  String? country;
  String? name;
  double? lat;
  double? lon;
  int? weatherId;
  String? main;
  String? description;
  String? icon;
  double? temp;
  double? feelsLike;
  double? minTemp;
  double? maxTemp;
  int? pressure;
  int? humidity;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  DateTime? timestamp;
  DateTime? sunrise;
  DateTime? sunset;

  WeatherResponse({
    this.id,
    this.country,
    this.name,
    this.lat,
    this.lon,
    this.weatherId,
    this.main,
    this.description,
    this.icon,
    this.temp,
    this.feelsLike,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.humidity,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.timestamp,
    this.sunrise,
    this.sunset,
  });

  factory WeatherResponse.fromMapJson(Map<String, dynamic> jsonMapObject) {
    return WeatherResponse(
      id: jsonMapObject["id"],
      country: jsonMapObject["sys"]["country"],
      name: jsonMapObject["name"],
      lat: jsonMapObject["coord"]["lat"],
      lon: jsonMapObject["coord"]["lon"],
      weatherId: jsonMapObject["weather"][0]["id"],
      main: jsonMapObject["weather"][0]["main"],
      description: jsonMapObject["weather"][0]["description"],
      icon: jsonMapObject["weather"][0]["icon"],
      temp: jsonMapObject["main"]["temp"],
      feelsLike: jsonMapObject["main"]["feels_like"],
      minTemp: jsonMapObject["main"]["temp_min"],
      maxTemp: jsonMapObject["main"]["temp_max"],
      pressure: jsonMapObject["main"]["pressure"],
      humidity: jsonMapObject["main"]["humidity"],
      visibility: jsonMapObject["visibility"],
      windSpeed: jsonMapObject["wind"]["speed"],
      windDeg: jsonMapObject["wind"]["deg"],
      timestamp:
          DateTime.fromMillisecondsSinceEpoch(jsonMapObject["dt"] * 1000),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
          jsonMapObject["sys"]["sunrise"] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(
          jsonMapObject["sys"]["sunset"] * 1000),
    );
  }

  Weather toEntity() => Weather(
        country: country,
        name: name,
        lat: lat,
        lon: lon,
        weatherId: weatherId,
        main: main,
        description: description,
        weatherCondition: icon,
        temp: temp!.round(),
        feelsLike: feelsLike!.round(),
        minTemp: minTemp!.round(),
        maxTemp: maxTemp!.round(),
        humidity: humidity,
        visibility: visibility,
        windSpeed: windSpeed!.round(),
        timestamp: Jalali.fromDateTime(timestamp!),
        sunrise: Jalali.fromDateTime(sunrise!),
        sunset: Jalali.fromDateTime(sunset!),
      );
}
