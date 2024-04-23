import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool dataLoaded = false;
  bool isRectangle = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        dataLoaded = true;
      });
    }).then(
      (value) => Future.delayed(
        const Duration(milliseconds: 100),
        () => setState(() {
          isRectangle = true;
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            if (!dataLoaded)
              BounceInUp(
                child: const CupertinoActivityIndicator(
                  color: Colors.deepPurpleAccent,
                ),
              ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: dataLoaded ? 3.sw : 0,
              height: dataLoaded ? 1.sh : 0,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: isRectangle ? BoxShape.rectangle : BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'Weather App',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
