import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/core/constants/app_constant.dart';
import 'package:weather_app/core/failures/exceptions.dart';
import 'package:weather_app/data/datasources/weather_remote_datasource.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/domain/usecases/get_weather.dart';

import '../../fixture/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client mockClient;
  late WeatherRemoteDatasource remote;

  setUp(() {
    mockClient = MockHttpClient();
    remote = WeatherRemoteDatasourceImpl(client: mockClient);
    registerFallbackValue(Uri());
  });
  tearDown(() {});

  const tWeather = WeatherModel.empty();
  const tParams = WeatherParams.empty();

  group('getWeather', () {
    test('Should perform a GET request on an URL', () async {
      // arrange
      when(() => mockClient.get(any(that: isA<Uri>()))).thenAnswer(
        (_) async => http.Response(fixtureReader('weather.json'), 200),
      );
      // act
      await remote.getWeather(lat: tParams.lat, lon: tParams.lon);
      // assert
      verify(
        () => mockClient.get(
          Uri.parse(
            '${AppConstant.baseUrl}'
            'latitude=${tParams.lat}&longitude=${tParams.lon}'
            '${AppConstant.continualOfUrl}',
          ),
        ),
      ).called(1);
      verifyNoMoreInteractions(mockClient);
    });

    test('Should return [WeatherModel] when the response is 200', () async {
      // arrange
      when(() => mockClient.get(any(that: isA<Uri>()))).thenAnswer(
        (_) async => http.Response(fixtureReader('weather.json'), 200),
      );
      // act
      final result =
          await remote.getWeather(lat: tParams.lat, lon: tParams.lon);
      // assert
      expect(result, tWeather);
    });

    test('Should throw a server exception when the response code is not 200',
        () async {
      // arrange
      when(() => mockClient.get(any(that: isA<Uri>()))).thenAnswer(
        (_) async => http.Response(
          '{"error": true, "reason": "Cannot initialize WeatherVariable from '
          'invalid String value tempeture_2m for key hourly"}',
          400,
        ),
      );
      // act
      final result = remote.getWeather(lat: tParams.lat, lon: tParams.lon);
      // assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
