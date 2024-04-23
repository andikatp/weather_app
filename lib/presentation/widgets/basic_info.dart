import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/widgets/info_widget.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
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
    );
  }
}
