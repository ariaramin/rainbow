import 'package:rainbow/home/domain/entity/weather.dart';

abstract class HomeState {}

class WeatherIsNotSearched extends HomeState {}

class WeatherIsLoading extends HomeState {}

class WeatherIsLoaded extends HomeState {
  final Weather _weather;
  WeatherIsLoaded(this._weather);
  Weather get getWeather => _weather;
}

class WeatherIsNotLoaded extends HomeState {
  final String _message;
  WeatherIsNotLoaded(this._message);
  String get getMessage => _message;
}
