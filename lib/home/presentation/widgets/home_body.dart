import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rainbow/home/domain/entity/weather.dart';
import 'package:rainbow/home/presentation/bloc/home_bloc.dart';
import 'package:rainbow/home/presentation/bloc/home_event.dart';
import 'package:rainbow/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rainbow/home/presentation/constants/app_colors.dart';
import 'package:rainbow/home/presentation/utility/utility.dart';
import 'package:rainbow/home/presentation/widgets/weather_detail.dart';
import 'package:rainbow/home/presentation/widgets/weather_sunset_sunset.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is WeatherIsNotSearched) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 76),
                    child: Image.asset("assets/images/weather.png"),
                  );
                }
                if (state is WeatherIsNotLoaded) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 76),
                        child: Image.asset("assets/images/404.png"),
                      ),
                      Text(
                        state.getMessage == "Not Found"
                            ? "شهر مورد نظر یافت نشد"
                            : state.getMessage,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                }
                if (state is WeatherIsLoading) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 76),
                        child: Image.asset("assets/images/searching.png"),
                      ),
                      const Text(
                        "درحال جستجوی شهر مورد نظر...",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  );
                } else if (state is WeatherIsLoaded) {
                  return _getWeatherUi(state.getWeather);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getWeatherUi(Weather weather) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getWeatherTemp(weather),
          const SizedBox(
            height: 32,
          ),
          WeatherSunriseSunset(
            weather: weather,
          ),
          const SizedBox(
            height: 18,
          ),
          WeatherDetail(
            weather: weather,
          ),
        ],
      ),
    );
  }

  Widget _getWeatherTemp(Weather weather) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${convertToPersianNumber(weather.temp!)}\u00B0",
                    style: const TextStyle(
                      fontSize: 56,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "${weather.name!}, ${weather.country!}",
                    style: const TextStyle(
                      fontSize: 28,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Image.asset(
                getWeatherImage(weather.weatherCondition!),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        _getWeatherTempDetail(weather),
      ],
    );
  }

  Widget _getWeatherTempDetail(Weather weather) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${convertToPersianNumber(weather.minTemp!)}\u00B0",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
              textDirection: TextDirection.ltr,
            ),
            Text(
              "${convertToPersianNumber(weather.maxTemp!)}\u00B0 / ",
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textColor,
              ),
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(
              width: 6,
            ),
            const Text(
              "دمای محسوس",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
              ),
            ),
            Text(
              "${convertToPersianNumber(weather.feelsLike!)}\u00B0",
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.textColor,
              ),
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          dateFormater(weather.timestamp!),
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }
}
