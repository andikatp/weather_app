// ignore_for_file: lines_longer_than_80_chars

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({
    required this.weather,
    super.key,
  });
  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().hour;

    String getWeatherCode() {
      switch (weather.hourly.weatherCode[now]) {
        case <= 2:
          return 'Sunny';
        case <= 48:
          return 'Cloudy';
        default:
          return 'Rain';
      }
    }

    return SliverToBoxAdapter(
      child: Container(
        height: 150.h,
        width: double.infinity,
        margin: REdgeInsets.all(16).copyWith(top: 0),
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundColor: Colors.white,
                  child: Spin(
                    duration: const Duration(seconds: 3),
                    child: Icon(
                      Icons.history_toggle_off,
                      size: 16.sp,
                    ),
                  ),
                ),
                const Text('Hourly Forecast'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                6,
                (index) {
                  final hour = (now + index) % 24;
                  final isPM = hour >= 12;
                  final amPm = isPM ? 'PM' : 'AM';
                  return BounceInRight(
                    delay: Duration(milliseconds: index * 350),
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: index == 0
                                    ? 'Now'
                                    : '${((now + index) % 12) == 0 ? 12 : (now + index) % 12}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: index == 0 ? null : ' $amPm',
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          getWeatherCode() == 'Sunny'
                              ? 'assets/svg/cloud_and_sun.svg'
                              : getWeatherCode() == 'Cloudy'
                                  ? 'assets/svg/cloudy.svg'
                                  : 'assets/svg/rain.svg',
                          height: 35.h,
                        ),
                        Text(
                          '${weather.hourly.temperature2M[now + index].toInt()}\u00B0',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
