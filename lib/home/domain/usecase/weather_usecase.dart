import 'package:rainbow/home/data/failures/failures.dart';
import 'package:rainbow/home/data/repository/weather_repository.dart';
import 'package:rainbow/home/domain/entity/weather.dart';
import 'package:rainbow/injection/injection.dart';
import 'package:dartz/dartz.dart';

class WeatherUsecase {
  final WeatherRepository _repository = locator.get();

  Future<Either<Failure, Weather>> getCurrentWeather(String city) async {
    return _repository.getCurrentWeather(city);
  }
}
