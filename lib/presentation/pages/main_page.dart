import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/widgets/app_bar.dart';
import 'package:weather_app/presentation/widgets/basic_info.dart';
import 'package:weather_app/presentation/widgets/chance_of_rain.dart';
import 'package:weather_app/presentation/widgets/chip_menu.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast.dart';
import 'package:weather_app/presentation/widgets/start_end_day.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final labels = ['Today', 'Tommorow', '7 Days'];

  late DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final currentHour = now.hour;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => ChipMenu(
                    chipLabel: labels[index],
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isActive: index == selectedIndex,
                  ),
                ),
              ),
            ),
          ),
          const BasicInfo(),
          HourlyForecast(currentHour: currentHour),
          ChanceOfRain(currentHour: currentHour),
          const StartEndDay(),
        ],
      ),
    );
  }
}
