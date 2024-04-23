import 'package:get_it/get_it.dart';
import 'package:http/http.dart'as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/core/utils/network_info.dart';
import 'package:weather_app/data/datasources/weather_local_datasource.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/repositories/weather_repository_impl.dart';
import 'package:weather_app/domain/repositories/weather_repository.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';
import 'package:weather_app/domain/usecases/search_by_city.dart';
import 'package:weather_app/presentation/bloc/weather_bloc.dart';
part 'dependency_container.main.dart';
