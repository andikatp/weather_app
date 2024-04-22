class AppConstant {
  AppConstant._();

  //network stuff
  static const String baseUrl = 'https://api.open-meteo.com/v1/forecast?';
  static const String continualOfUrl =
      '&hourly=temperature_2m,precipitation_probability,weather_code,'
      'pressure_msl,wind_speed_180m&daily=weather_code,sunrise,sunset,'
      'uv_index_max&timezone=Asia%2FSingapore';
  static const int successfulHttpGetStatusCode = 200;
  static const int successfulHttpPostStatusCode = 201;
}
