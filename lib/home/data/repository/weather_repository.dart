import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:rainbow/home/data/datasource/network_datasource.dart';
import 'package:rainbow/home/data/failures/failures.dart';
import 'package:rainbow/home/domain/entity/weather.dart';
import 'package:rainbow/injection/injection.dart';
import 'package:rainbow/home/data/exceptions/api_exception.dart';

abstract class IWeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String city);
}

class WeatherRepository extends IWeatherRepository {
  final NetworkDatasource _datasource = locator.get();

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String city) async {
    try {
      var weather = await _datasource.getCurrentWeather(city);
      return Right(weather.toEntity());
    } on ApiException catch (ex) {
      return Left(ServerFailure(ex.message ?? ""));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
