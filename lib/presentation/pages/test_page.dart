import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: CustomSliverAppBar(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 2.sh,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AppBar(
      flexibleSpace: FlexibleSpaceBar.createSettings(
        maxExtent: maxExtent,
        minExtent: minExtent,
        child: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(
            left: srinkRate(shrinkOffset) == 1 ? 40 : 10,
          ),
          title: Text(
            srinkRate(shrinkOffset) == 1 ? 'shrinked' : 'Available seats',
          ),
        ),
        currentExtent: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
      ),
    );
  }

  @override
  double get maxExtent => 400;

  @override
  double get minExtent => 200;

  double get delta => maxExtent - minExtent;

  double srinkRate(double shrinkOffset) =>
      (shrinkOffset / delta).clamp(0.0, 1.0);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
