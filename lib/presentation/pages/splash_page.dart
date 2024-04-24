import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/pages/main_page.dart';

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
      context.read<WeatherBloc>().add(const GetLocationEvent());
      setState(() {
        dataLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {
          if (state is LocationObtained) {
            Future.delayed(
              const Duration(milliseconds: 100),
              () {
                setState(() {
                  isRectangle = true;
                });
                context.read<WeatherBloc>().add(
                      GetWeatherEvent(
                        lat: state.location.latitude,
                        lon: state.location.longitude,
                      ),
                    );
              },
            );
          }
          if (state is WeatherLoaded) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute<MainPage>(
                builder: (context) => MainPage(
                  todayWeather: state.todayWeather,
                  tomorrowWeather: state.tomorrowWeather,
                  seventhDayWeather: state.seventhDayWeather,
                ),
              ),
            );
          }
          if (state is WeatherError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Center(
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
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
