// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/presentation/widgets/info_widget.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({required this.weather, required this.dayType, super.key});
  final WeatherEntity weather;
  final int dayType;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().hour;
    return SliverPadding(
      padding: REdgeInsets.all(16).copyWith(top: 0),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 1,
        children: [
          InfoWidget(
            icon: Icons.air,
            label: 'Wind Speed',
            value: '${weather.hourly.windSpeed180M[now]}km/h',
            differences:
                '${(weather.hourly.windSpeed180M[now] - weather.hourly.windSpeed180M[now - 1]).roundToDouble().toInt()} km/h',
            isHigherThanBefore: weather.hourly.windSpeed180M[now] >
                weather.hourly.windSpeed180M[now - 1],
          ),
          InfoWidget(
            icon: Icons.cloudy_snowing,
            label: 'Rain Chance',
            value: '${weather.hourly.precipitationProbability[now]}%',
            differences:
                '${(weather.hourly.precipitationProbability[now] - weather.hourly.precipitationProbability[now - 1]).roundToDouble().toInt()}%',
            isHigherThanBefore: weather.hourly.precipitationProbability[now] >
                weather.hourly.precipitationProbability[now - 1],
          ),
          InfoWidget(
            icon: Icons.waves,
            label: 'Pressure',
            value: '${weather.hourly.pressureMsl[now].toInt()} hpa',
            differences:
                '${(weather.hourly.pressureMsl[now] - weather.hourly.pressureMsl[now - 1]).roundToDouble().toInt()} hpa',
            isHigherThanBefore: weather.hourly.pressureMsl[now] >
                weather.hourly.pressureMsl[now - 1],
          ),
          InfoWidget(
            icon: Icons.sunny,
            label: 'UV Index',
            value: '${weather.daily.uvIndexMax[dayType]}',
            differences: '0.3',
            isHigherThanBefore: false,
          ),
        ],
      ),
    );
  }
}
