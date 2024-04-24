import 'package:flutter/material.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/presentation/widgets/app_bar.dart';
import 'package:weather_app/presentation/widgets/basic_info.dart';
import 'package:weather_app/presentation/widgets/chance_of_rain.dart';
import 'package:weather_app/presentation/widgets/chip_menu.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast.dart';
import 'package:weather_app/presentation/widgets/start_end_day.dart';

class MainPage extends StatefulWidget {
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
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int dayType = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> getWeatherBasedOnType(int number) async {
      setState(() => isLoading = true);
      await Future<void>.delayed(const Duration(milliseconds: 500));
      setState(() {
        switch (number) {
          case 0:
            dayType = 0;
          case 1:
            dayType = 1;
          default:
            dayType = 6;
        }
        isLoading = false;
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          AppBarWidget(weather: widget.todayWeather),
          ChipMenu(onPressed: getWeatherBasedOnType),
          BasicInfo(
            weather: dayType == 0
                ? widget.todayWeather
                : dayType == 1
                    ? widget.tomorrowWeather
                    : widget.seventhDayWeather,
            dayType: dayType,
            isLoading: isLoading,
          ),
          HourlyForecast(
            weather: dayType == 0
                ? widget.todayWeather
                : dayType == 1
                    ? widget.tomorrowWeather
                    : widget.seventhDayWeather,
            isLoading: isLoading,
          ),
          ChanceOfRain(
            weather: dayType == 0
                ? widget.todayWeather
                : dayType == 1
                    ? widget.tomorrowWeather
                    : widget.seventhDayWeather,
            isLoading: isLoading,
          ),
          StartEndDay(
            weather: dayType == 0
                ? widget.todayWeather
                : dayType == 1
                    ? widget.tomorrowWeather
                    : widget.seventhDayWeather,
            dayType: dayType,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
