import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomSliverAppBar(),
      pinned: true,
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
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: REdgeInsets.only(left: 16),
        child: Text(
          'Banda Aceh, Indonesia',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color:
                    srinkRate(shrinkOffset) == 1 ? Colors.black : Colors.white,
              ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
      shape: srinkRate(shrinkOffset) == 1 ? null : RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(30).r,
          bottomRight: const Radius.circular(30).r,
        ),
      ),
      leadingWidth: 0.7.sw,
      flexibleSpace: FlexibleSpaceBar.createSettings(
        maxExtent: maxExtent,
        minExtent: minExtent,
        child: FlexibleSpaceBar(
          background: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30).r,
                  bottomRight: const Radius.circular(30).r,
                ),
                child: Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: REdgeInsets.only(left: 20, top: 40),
                child: Text(
                  '32\u00B0',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white, fontSize: 76.sp),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: REdgeInsets.only(right: 20),
                child: Wrap(
                  spacing: 12.w,
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset('assets/svg/cloud_and_sun.svg'),
                    Text(
                      'Cloudy',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 15.h,
                left: 20.w,
                child: Text(
                  'March 23, 11:24',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 15.h,
                right: 20.w,
                child: Column(
                  children: [
                    Text(
                      'Day 32\u00B0',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'Night 27\u00B0',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        currentExtent: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
      ),
    );
  }

  @override
  double get maxExtent => 0.4.sh;

  @override
  double get minExtent => 0.2.sh;

  double get delta => maxExtent - minExtent;

  double srinkRate(double shrinkOffset) =>
      (shrinkOffset / delta).clamp(0.0, 1.0);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
