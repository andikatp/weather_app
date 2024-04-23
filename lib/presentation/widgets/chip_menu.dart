import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipMenu extends StatelessWidget {
  const ChipMenu({
    required this.chipLabel,
    required this.onPressed,
    required this.isActive,
    super.key,
  });

  final String chipLabel;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Chip(
        label: SizedBox(
          width: 70.w,
          height: 25.h,
          child: Center(
            child: Text(
              chipLabel,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        backgroundColor:
            isActive ? Theme.of(context).colorScheme.primary : Colors.white,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        side: const BorderSide(style: BorderStyle.none),
        visualDensity: const VisualDensity(horizontal: 4),
      ),
    );
  }
}
