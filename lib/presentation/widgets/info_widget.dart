import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    required this.label,
    required this.value,
    required this.differences,
    required this.isHigherThanBefore,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final String differences;
  final bool isHigherThanBefore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                child: Spin(
                  duration: const Duration(seconds: 3),
                  child: Icon(icon, size: 16.sp),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label),
                  Text(value),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                isHigherThanBefore
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                color: isHigherThanBefore ? Colors.purple : Colors.red,
              ),
              Text(
                differences,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
