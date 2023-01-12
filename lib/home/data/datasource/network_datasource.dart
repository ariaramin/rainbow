import 'dart:math';

import 'package:rainbow/home/data/models/weather_response.dart';
import 'package:rainbow/home/data/datasource/datasource.dart';
import 'package:rainbow/injection/injection.dart';
import 'package:dio/dio.dart';
import 'package:rainbow/home/data/exceptions/api_exception.dart';

class NetworkDatasource implements IDatasource {
  final Dio _dio = locator.get();

  @override
  Future<WeatherResponse> getCurrentWeather(String city) async {
    try {
      var response = await _dio.get("weather", queryParameters: {"q": city});
      if (response.statusCode == 200) {
        var weather = WeatherResponse.fromMapJson(response.data);
        return weather;
      }
    } on DioError catch (ex) {
      throw ApiException(
        ex.response?.statusCode,
        ex.response?.statusMessage,
      );
    } catch (ex) {
      throw ApiException(0, "مشکلی پیش آمده است.");
    }
    return WeatherResponse();
  }
}
