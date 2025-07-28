import 'dart:convert';

class RealtimeWeatherResponse {
  final List<WeatherResult>? results;
  
  const RealtimeWeatherResponse({required this.results});

  factory RealtimeWeatherResponse.fromJson(Map<String, dynamic> json) {
    return RealtimeWeatherResponse(
      results: (json['results'] as List)
          .map((e) => WeatherResult.fromJson(e))
          .toList(),
    );
  }

  static RealtimeWeatherResponse? parseFromString(String jsonString) {
    try {
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      return RealtimeWeatherResponse.fromJson(jsonMap);
    } catch (e) {
      print('Error parsing WeatherResponse: $e');
      return null;
    }
  }
}

class WeatherResult {
  final Location? location;
  final WeatherNow? now;
  final String? lastUpdate;

  WeatherResult({
    this.location,
    this.now,
    this.lastUpdate,
  });

  factory WeatherResult.fromJson(Map<String, dynamic> json) {
    return WeatherResult(
      location: Location.fromJson(json['location']),
      now: WeatherNow.fromJson(json['now']),
      lastUpdate: json['last_update'],
    );
  }
}

class Location {
  String id;
  String name;
  String country;
  String path;
  String timezone;
  String timezoneOffset;

  Location({
    required this.id,
    required this.name,
    required this.country,
    required this.path,
    required this.timezone,
    required this.timezoneOffset,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      country: json['country'],
      path: json['path'],
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
    );
  }
}

class WeatherNow {
  final String? text; // 天气现象文字
  final String? code; // 天气现象代码
  final String? temperature; // 温度，单位为c摄氏度或f华氏度
  final String? feelsLike; // 体感温度，单位为c摄氏度或f华氏度，暂不支持国外城市
  final String? pressure; // 气压，单位为mb百帕或in英寸
  final String? humidity; // 相对湿度，0~100，单位为百分比
  final String? visibility; // 能见度，单位为km公里或mi英里
  final String? windDirection; // 风向文字
  final String? windDirectionDegree; // 风向角度，范围0~360，0为正北，90为正东，180为正南，270为正西
  final String? windSpeed; // 风速，单位为km/h公里每小时或mph英里每小时
  final String? windScale; // 风力等级
  final String? clouds; // 云量，单位%，范围0~100，天空被云覆盖的百分比（目前不支持中国城市）
  final String? dewPoint; // 露点温度

  WeatherNow({
    this.text,
    this.code,
    this.temperature,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.visibility,
    this.windDirection,
    this.windDirectionDegree,
    this.windSpeed,
    this.windScale,
    this.clouds,
    this.dewPoint,
  });

  factory WeatherNow.fromJson(Map<String, dynamic> json) {
    return WeatherNow(
      text: json['text'],
      code: json['code'],
      temperature: json['temperature'],
      feelsLike: json['feels_like'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      visibility: json['visibility'],
      windDirection: json['wind_direction'],
      windDirectionDegree: json['wind_direction_degree'],
      windSpeed: json['wind_speed'],
      windScale: json['wind_scale'],
      clouds: json['clouds'],
      dewPoint: json['dew_point'],
    );
  }
}