import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChipMenu extends StatefulWidget {
  const ChipMenu({
    required this.onPressed,
    super.key,
  });

  final void Function(int newNumber) onPressed;

  @override
  State<ChipMenu> createState() => _ChipMenuState();
}

class _ChipMenuState extends State<ChipMenu> {
  final labels = ['Today', 'Tomorrow', '7 Days'];
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: REdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            3,
            (index) => ChoiceChip(
              elevation: 2,
              label: SizedBox(
                width: 70.w,
                height: 25.h,
                child: Center(
                  child: Text(
                    labels[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              surfaceTintColor: Colors.purple,
              selected: _value == index,
              showCheckmark: false,
              side: BorderSide.none,
              backgroundColor: Colors.white,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
                widget.onPressed(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}


      // child: Chip(
      //   label: SizedBox(
      //     width: 70.w,
      //     height: 25.h,
      //     child: Center(
      //       child: Text(
      //         chipLabel,
      //         textAlign: TextAlign.center,
      //       ),
      //     ),
      //   ),
      //   backgroundColor:
      //       isActive ? Theme.of(context).colorScheme.primary : Colors.white,
      //   labelStyle: Theme.of(context).textTheme.bodyMedium,
      //   side: const BorderSide(style: BorderStyle.none),
      //   visualDensity: const VisualDensity(horizontal: 4),
      // ),
