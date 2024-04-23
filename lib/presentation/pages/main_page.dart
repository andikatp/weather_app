import 'package:flutter/material.dart';
import 'package:weather_app/presentation/widgets/app_bar.dart';
import 'package:weather_app/presentation/widgets/basic_info.dart';
import 'package:weather_app/presentation/widgets/chance_of_rain.dart';
import 'package:weather_app/presentation/widgets/chip_menu.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast.dart';
import 'package:weather_app/presentation/widgets/start_end_day.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentHour = now.hour;

    void getWeatherBasedOnType(int number) {
      switch (number) {
        case 1: //Today
        case 2: //Tomorrow
        default: // 7 Days
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(),
          ChipMenu(onPressed: getWeatherBasedOnType),
          const BasicInfo(),
          HourlyForecast(currentHour: currentHour),
          ChanceOfRain(currentHour: currentHour),
          const StartEndDay(),
        ],
      ),
    );
  }
}
