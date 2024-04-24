// ignore_for_file: lines_longer_than_80_chars

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/domain/entities/weather_entity.dart';
import 'package:weather_app/presentation/widgets/shimmer.dart';

class ChanceOfRain extends StatelessWidget {
  const ChanceOfRain({
    required this.weather,
    required this.isLoading,
    super.key,
  });
  final WeatherEntity weather;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().hour;

    return SliverToBoxAdapter(
      child: shimmer(
        isLoading: isLoading,
        context: context,
        child: Container(
          height: 180.h,
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
                        Icons.calendar_month,
                        size: 16.sp,
                      ),
                    ),
                  ),
                  const Text('Chance of Rain'),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 8.h,
                  children: List.generate(4, (index) {
                    final hour = (now + index) % 24;
                    final isPM = hour + index >= 12;
                    final amPm = isPM ? 'PM' : 'AM';
                    return SizedBox(
                      width: 0.85.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 0.15.sw,
                            child: Text(
                              '${((now + index) % 12) == 0 ? 12 : (now + index) % 12} $amPm',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          SizedBox(
                            width: 0.5.sw,
                            child: LinearProgressIndicator(
                              value: weather.hourly
                                      .precipitationProbability[now + index] /
                                  100,
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.onPrimary,
                              ),
                              minHeight: 20.h,
                              borderRadius: BorderRadius.circular(12).r,
                            ),
                          ),
                          SizedBox(
                            width: 0.10.sw,
                            child: Text(
                              '${weather.hourly.precipitationProbability[now + index]}%',
                              style: Theme.of(context).textTheme.labelLarge,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
