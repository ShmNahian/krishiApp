import '../domain/models/weather_info.dart';

class MockWeatherRepository {
  WeatherInfo getTodayWeather() {
    return WeatherInfo(
        temperatureC: 29.4, rainChance: 35, condition: 'মেঘলা আকাশ');
  }
}
