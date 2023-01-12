import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rainbow/home/domain/entity/weather.dart';
import 'package:rainbow/home/presentation/constants/app_colors.dart';
import 'package:rainbow/home/presentation/utility/utility.dart';

class WeatherDetail extends StatelessWidget {
  Weather weather;
  WeatherDetail({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white.withOpacity(.2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 42,
                      height: 56,
                      child: Image.asset("assets/images/mist.png"),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "میدان دید",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      convertToPersianNumber(weather.visibility!),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 98,
                  child: VerticalDivider(
                    thickness: .5,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 30,
                      height: 56,
                      child: Image.asset("assets/images/humidity.png"),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "رطوبت",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${convertToPersianNumber(weather.humidity!)}٪",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 98,
                  child: VerticalDivider(
                    thickness: .5,
                    color: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 42,
                      height: 56,
                      child: Image.asset("assets/images/wind.png"),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "باد",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      "${convertToPersianNumber(weather.windSpeed!)} km/h",
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
