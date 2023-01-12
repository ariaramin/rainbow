import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow/home/domain/usecase/weather_usecase.dart';
import 'package:rainbow/home/presentation/bloc/home_event.dart';
import 'package:rainbow/home/presentation/bloc/home_state.dart';
import 'package:rainbow/injection/injection.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherUsecase _usecase = locator.get();

  HomeBloc() : super(WeatherIsNotSearched()) {
    on<FetchWeather>(
      (event, emit) async {
        emit(WeatherIsLoading());
        final cityName = event.getCityName;
        var data = await _usecase.getCurrentWeather(cityName);
        data.fold(
          (failure) {
            emit(WeatherIsNotLoaded(failure.message));
          },
          (data) {
            emit(WeatherIsLoaded(data));
          },
        );
      },
    );
    on<ResetWeather>(
      (event, emit) {
        emit(WeatherIsNotSearched());
      },
    );
  }
}
