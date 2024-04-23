part of 'dependency_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initWeather();
}

Future<void> _initWeather() async {
  await GetIt.instance.isReady<SharedPreferences>();
  //feature --> Weather
  //Business Logic
  sl
    ..registerFactory(() => WeatherBloc(getWeather: sl(), searchByCity: sl()))
    // usecases
    ..registerLazySingleton(() => GetWeatherUsecase(repository: sl()))
    ..registerLazySingleton(() => SearchByCityUseCase(repository: sl()))
    // repositories
    ..registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(remote: sl(), local: sl(), networkInfo: sl()),
    )
    // datasources
    ..registerLazySingleton<WeatherRemoteDatasource>(
      () => WeatherRemoteDatasourceImpl(client: sl()),
    )
    ..registerLazySingleton<WeatherLocalDatasource>(
      () => WeatherLocalDatasourceImpl(sharedPreferences: sl()),
    )
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(networkInfo: sl()),
    )
    // others
    ..registerLazySingleton(http.Client.new)
    ..registerLazySingletonAsync(SharedPreferences.getInstance)
    ..registerLazySingleton(InternetConnection.new);
}
