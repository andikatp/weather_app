import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/widgets/app_bar.dart';
import 'package:weather_app/presentation/widgets/chip_menu.dart';
import 'package:weather_app/presentation/widgets/info_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final labels = ['Today', 'Tommorow', '7 Days'];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _isSliverAppBarNotExpanded =>
      _scrollController.hasClients &&
      _scrollController.offset > (200 - kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const AppBarWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => ChipMenu(
                    chipLabel: labels[index],
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    isActive: index == selectedIndex,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
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
                  label: 'Wind Speed',
                  value: '12km/h',
                  differences: '2km/h',
                  isHigherThanBefore: false,
                ),
                InfoWidget(
                  icon: Icons.sunny,
                  label: 'Wind Speed',
                  value: '12km/h',
                  differences: '2km/h',
                  isHigherThanBefore: false,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1.sh,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
