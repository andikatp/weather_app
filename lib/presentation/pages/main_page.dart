import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:weather_app/presentation/widgets/app_bar.dart';
import 'package:weather_app/presentation/widgets/chip_menu.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast.dart';
import 'package:weather_app/presentation/widgets/info_widget.dart';

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
          SliverPadding(
            padding: REdgeInsets.all(16).copyWith(top: 0),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3 / 1,
              children: const [
                InfoWidget(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '12km/h',
                  differences: '2km/h',
                  isHigherThanBefore: false,
                ),
                InfoWidget(
                  icon: Icons.cloudy_snowing,
                  label: 'Rain Chance',
                  value: '24%',
                  differences: '10%',
                  isHigherThanBefore: true,
                ),
                InfoWidget(
                  icon: Icons.waves,
                  label: 'Pressure',
                  value: '720 hpa',
                  differences: '32 hpa',
                  isHigherThanBefore: false,
                ),
                InfoWidget(
                  icon: Icons.sunny,
                  label: 'UV Index',
                  value: '2.3',
                  differences: '0.3',
                  isHigherThanBefore: false,
                ),
              ],
            ),
          ),
          HourlyForecast(currentHour: currentHour),
          SliverToBoxAdapter(
            child: Container(
              height: 220.h,
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
                        child: Icon(
                          Icons.history_toggle_off,
                          size: 16.sp,
                        ),
                      ),
                      const Text('Hourly forecast'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: List.generate(4, (index) {
                      final hour = (currentHour + index) % 24;
                      final isPM = hour >= 12;
                      final displayHour = hour > 12 ? hour - 12 : hour;
                      final amPm = isPM ? 'PM' : 'AM';

                      return Row(
                        children: [
                          Text(
                            '$hour $amPm',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1.sh,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
