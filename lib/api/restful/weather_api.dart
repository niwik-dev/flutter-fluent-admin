import 'package:dio/dio.dart';

import '../../model/response/daily_weather.dart';
import '../../model/response/realtime_weather.dart';
import '../../utils/request_utils.dart';

class WeatherApi{
  // 单例模式
  static final WeatherApi _instance = WeatherApi._internal();
  factory WeatherApi() => _instance;
  WeatherApi._internal();

  static const String apiKey = "S1pZjMGkAkwaYemeH";

  // 获取天气实况
  Future<RealtimeWeatherResponse> getRealTimeWeather(String location) async {
    String url = "https://api.seniverse.com/v3/weather/now.json?key=$apiKey&location=$location&language=zh-Hans&unit=c";
    Response response = await RequestUtils.get(url);
    RealtimeWeatherResponse realTimeWeather = RealtimeWeatherResponse.fromJson(response.data);
    return realTimeWeather;
  }

  Future<DailyWeatherResponse> getDailyWeather(String location) async {
    String url = "https://api.seniverse.com/v3/weather/daily.json?key=$apiKey&location=$location&language=zh-Hans&unit=c&start=0&days=5";
    Response response = await RequestUtils.get(url);
    DailyWeatherResponse dailyWeather = DailyWeatherResponse.fromJson(response.data);
    return dailyWeather;
  }
}