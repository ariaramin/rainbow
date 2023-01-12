abstract class HomeEvent {}

class FetchWeather extends HomeEvent {
  final String _cityName;
  FetchWeather(this._cityName);
  String get getCityName => _cityName;
}

class ResetWeather extends HomeEvent {}
