import 'package:rainbow/home/data/models/weather_response.dart';

abstract class IDatasource {
  Future<WeatherResponse> getCurrentWeather(String city);
}
