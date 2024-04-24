import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/presentation/widgets/shimmer.dart';
import 'package:weather_app/presentation/widgets/sun_info_widget.dart';

class StartEndDay extends StatelessWidget {
  const StartEndDay({
    required this.weather,
    required this.dayType,
    required this.isLoading,
    super.key,
  });
  final WeatherEntity weather;
  final int dayType;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final sunrise = DateTime.parse(weather.daily.sunrise[dayType]);
    final sunset = DateTime.parse(weather.daily.sunset[dayType]);

    return SliverPadding(
      padding: REdgeInsets.all(16).copyWith(top: 0, bottom: 32),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 1,
        children: [
          shimmer(
            isLoading: isLoading,
            context: context,
            child: SunInfoWidget(
              icon: Icons.nights_stay,
              label: 'Sunrise',
              value: '${DateFormat('HH:mm').format(sunrise)} AM',
              differences: now.hour - sunrise.hour < 0
                  ? 'in ${(now.hour - sunrise.hour).abs()}h'
                  : '${now.hour - sunrise.hour}h ago',
            ),
          ),
          shimmer(
            isLoading: isLoading,
            context: context,
            child: SunInfoWidget(
              icon: Icons.history_toggle_off,
              label: 'Sunset',
              value: '${DateFormat('HH:mm').format(sunset)} PM',
              differences: now.hour - sunrise.hour >= 0
                  ? 'in ${sunset.hour - now.hour}h'
                  : '${sunset.hour - now.hour}h ago',
            ),
          ),
        ],
      ),
    );
  }
}
