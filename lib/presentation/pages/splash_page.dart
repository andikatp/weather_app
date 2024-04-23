import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/pages/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeIn(
          delay: const Duration(seconds: 1),
          onFinish: (direction) {
            ShakeY(
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
              ),
            );
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => const MainPage(),
            //   ),
            // );
          },
          child: const CircularProgressIndicator(),
        ),
      ),
    );
    // return Scaffold(
    //   body: BlocConsumer<WeatherBloc, WeatherState>(
    //     listener: (context, state) {
    //       if (state is WeatherLoaded) {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute<MainPage>(
    //             builder: (context) => const MainPage(),
    //           ),
    //         );
    //       }
    //     },
    //     builder: (context, state) {
    //       return const Center(
    //         child: Text('Loading'),
    //       );
    //     },
    //   ),
    // );
  }
}
