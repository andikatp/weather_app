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
      padding: REdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 15.r,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: Icon(icon, size: 16.sp),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              Text(value),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
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
          ),
        ],
      ),
    );
  }
}
