import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/presentation/widgets/app_bar.dart';
import 'package:weather_app/presentation/widgets/basic_info.dart';
import 'package:weather_app/presentation/widgets/chance_of_rain.dart';
import 'package:weather_app/presentation/widgets/chip_menu.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast.dart';
import 'package:weather_app/presentation/widgets/start_end_day.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    required this.todayWeather,
    required this.tomorrowWeather,
    required this.seventhDayWeather,
    super.key,
  });

  final WeatherEntity todayWeather;
  final WeatherEntity tomorrowWeather;
  final WeatherEntity seventhDayWeather;

  @override
  Widget build(BuildContext context) {
    var dayType = 0;

    void getWeatherBasedOnType(int number) {
      switch (number) {
        case 0:
          dayType = 0;
        case 1:
          dayType = 1;
        default:
          dayType = 6;
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          AppBarWidget(weather: todayWeather),
          ChipMenu(onPressed: getWeatherBasedOnType),
          BasicInfo(
            weather: todayWeather,
            dayType: dayType,
          ),
          HourlyForecast(
            weather: todayWeather,
          ),
          ChanceOfRain(weather: todayWeather),
          StartEndDay(
            weather: todayWeather,
            dayType: dayType,
          ),
        ],
      ),
    );
  }
}
