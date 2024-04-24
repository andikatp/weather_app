import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg_flutter.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({required this.currentHour, super.key});

  final int currentHour;

  @override
  Widget build(BuildContext context) {
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
                  final hour = (currentHour + index) % 24;
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
                                    : '${(currentHour + index) % 12}',
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
                        SvgPicture.asset('assets/svg/cloudy.svg', height: 35,),
                        const Text('10\u00B0'),
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
