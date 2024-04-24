import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmer({
  required bool isLoading,
  required Widget child,
  required BuildContext context,
}) {
  return !isLoading
      ? child
      : Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.secondary,
          highlightColor: Theme.of(context).colorScheme.primary,
          child: child,
        );
}
