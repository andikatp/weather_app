import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/widgets/sun_info_widget.dart';

class StartEndDay extends StatelessWidget {
  const StartEndDay({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: REdgeInsets.all(16).copyWith(top: 0),
      sliver: SliverGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        childAspectRatio: 3 / 1,
        children: const [
          SunInfoWidget(
            icon: Icons.nights_stay,
            label: 'Sunrise',
            value: '4:20 AM',
            differences: '4h ago',
          ),
          SunInfoWidget(
            icon: Icons.history_toggle_off,
            label: 'Sunset',
            value: '4:50 PM',
            differences: 'in 9h',
          ),
        ],
      ),
    );
  }
}
