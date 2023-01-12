import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:rainbow/home/data/datasource/network_datasource.dart';
import 'package:rainbow/home/data/repository/weather_repository.dart';
import 'package:rainbow/home/domain/usecase/weather_usecase.dart';
import 'package:rainbow/home/presentation/bloc/home_bloc.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  // dio
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://api.openweathermap.org/data/2.5/',
        queryParameters: {
          "appid": "05edfab0ce554b5384d1eb6a6b9cf815",
          "units": "metric",
        },
      ),
    ),
  );

  // network
  locator.registerFactory(() => NetworkDatasource());

  // weather repository
  locator.registerFactory(() => WeatherRepository());

  // home usecase
  locator.registerFactory(() => WeatherUsecase());
}
