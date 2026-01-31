import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_weather_repository.dart';
import '../domain/models/weather_info.dart';

final weatherRepositoryProvider =
    Provider<MockWeatherRepository>((ref) => MockWeatherRepository());
final todayWeatherProvider = Provider<WeatherInfo>(
    (ref) => ref.watch(weatherRepositoryProvider).getTodayWeather());
