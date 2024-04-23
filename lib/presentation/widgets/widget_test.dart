import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetTest extends StatefulWidget {
  const WidgetTest({super.key});

  @override
  State<WidgetTest> createState() => _WidgetTestState();
}

class _WidgetTestState extends State<WidgetTest> {
  bool isSelected = false;
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => ChoiceChip(
          label: SizedBox(
            width: 70.w,
            height: 25.h,
            child: const Center(
              child: Text(
                'chipLabel',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          selected: _value == index,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
            });
          },
        ),
      ),
    );
  }
}
