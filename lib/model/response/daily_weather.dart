import 'dart:convert';

class DailyWeatherResponse {
  List<WeatherResult>? results;

  DailyWeatherResponse({this.results});

  factory DailyWeatherResponse.fromJson(Map<String, dynamic> json) {
    return DailyWeatherResponse(
      results: (json['results'] as List?)?.map((e) => WeatherResult.fromJson(e)).toList(),
    );
  }

  static DailyWeatherResponse? parseFromString(String jsonString) {
    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return DailyWeatherResponse.fromJson(jsonMap);
    } catch (e) {
      print('Error parsing WeatherResponse: $e');
      return null;
    }
  }
}

class WeatherResult {
  Location? location;
  List<DailyWeather>? daily;
  String? lastUpdate;

  WeatherResult({
    this.location,
    this.daily,
    this.lastUpdate,
  });

  factory WeatherResult.fromJson(Map<String, dynamic> json) {
    return WeatherResult(
      location: json['location'] != null ? Location.fromJson(json['location']) : null,
      daily: (json['daily'] as List?)?.map((e) => DailyWeather.fromJson(e)).toList(),
      lastUpdate: json['last_update'] as String?,
    );
  }
}

class Location {
  String? id;
  String? name;
  String? country;
  String? path;
  String? timezone;
  String? timezoneOffset;

  Location({
    this.id,
    this.name,
    this.country,
    this.path,
    this.timezone,
    this.timezoneOffset,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      path: json['path'] as String?,
      timezone: json['timezone'] as String?,
      timezoneOffset: json['timezone_offset'] as String?,
    );
  }
}

class DailyWeather {
  String? date; // 日期（该城市的本地时间）
  String? textDay; // 白天天气现象文字
  String? codeDay; // 白天天气现象代码
  String? textNight; // 晚间天气现象文字
  String? codeNight; // 晚间天气现象代码
  String? high; // 当天最高温度
  String? low; // 当天最低温度
  String? precip; // 降水概率，范围0~1，单位百分比（目前仅支持国内城市）
  String? windDirection; // 风向文字
  String? windDirectionDegree; // 风向角度，范围0~360
  String? windSpeed; // 风速，单位km/h（当unit=c时）、mph（当unit=f时）
  String? windScale; // 风力等级
  String? rainfall; // 降水量，单位mm（目前仅支持国内城市）
  String? humidity; // 相对湿度，0~100，单位为百分比

  DailyWeather({
    this.date,
    this.textDay,
    this.codeDay,
    this.textNight,
    this.codeNight,
    this.high,
    this.low,
    this.precip,
    this.windDirection,
    this.windDirectionDegree,
    this.windSpeed,
    this.windScale,
    this.rainfall,
    this.humidity,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
      date: json['date'] as String?,
      textDay: json['text_day'] as String?,
      codeDay: json['code_day'] as String?,
      textNight: json['text_night'] as String?,
      codeNight: json['code_night'] as String?,
      high: json['high'] as String?,
      low: json['low'] as String?,
      precip: json['precip'] as String?,
      windDirection: json['wind_direction'] as String?,
      windDirectionDegree: json['wind_direction_degree'] as String?,
      windSpeed: json['wind_speed'] as String?,
      windScale: json['wind_scale'] as String?,
      rainfall: json['rainfall'] as String?,
      humidity: json['humidity'] as String?,
    );
  }
}