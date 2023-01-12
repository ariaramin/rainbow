import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rainbow/home/domain/entity/weather.dart';
import 'package:rainbow/home/presentation/constants/app_colors.dart';
import 'package:rainbow/home/presentation/utility/utility.dart';

class WeatherSunriseSunset extends StatelessWidget {
  Weather weather;
  WeatherSunriseSunset({super.key, required this.weather});

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
                    const Text(
                      "طلوع خورشید",
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
                      timeFormater(weather.sunrise!),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 98,
                      child: Image.asset("assets/images/sunrise.png"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "غروب خورشید",
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
                      timeFormater(weather.sunset!),
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textColor,
                      ),
                      textDirection: TextDirection.ltr,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: 98,
                      child: Image.asset("assets/images/sunset.png"),
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
