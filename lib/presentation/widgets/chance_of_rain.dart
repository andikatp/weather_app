import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChanceOfRain extends StatelessWidget {
  const ChanceOfRain({required this.currentHour, super.key});
  final int currentHour;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                  child: Icon(
                    Icons.calendar_month,
                    size: 16.sp,
                  ),
                ),
                const Text('Hourly forecast'),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                direction: Axis.vertical,
                spacing: 8.h,
                children: List.generate(4, (index) {
                  final hour = (currentHour + index) % 24;
                  final isPM = hour >= 12;
                  final amPm = isPM ? 'PM' : 'AM';
                  return SizedBox(
                    width: 0.85.sw,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '$hour $amPm',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SizedBox(
                          width: 0.5.sw,
                          child: LinearProgressIndicator(
                            value: 27 / 100,
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).colorScheme.onPrimary,
                            ),
                            minHeight: 20.h,
                            borderRadius: BorderRadius.circular(12).r,
                          ),
                        ),
                        Text(
                          '27%',
                          style: Theme.of(context).textTheme.labelLarge,
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
    );
  }
}
