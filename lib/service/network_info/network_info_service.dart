import 'package:flutter/services.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoService{
  // 单例模式
  static final NetworkInfoService _instance = NetworkInfoService._internal();
  factory NetworkInfoService() => _instance;
  NetworkInfoService._internal();

  final NetworkInfo networkInfo = NetworkInfo();

  Future<String?> getWifiName() async {
    try{
      var wifiName = await networkInfo.getWifiName();
      return wifiName;
    } on PlatformException catch (exception) {
      return "不支持显示";
    }
  }

  Future<String?> getWifiBSSID() async {
    try{
      var wifiBSSID = await networkInfo.getWifiBSSID();
      return wifiBSSID;
    } on PlatformException catch (exception) {
      return "不支持显示";
    }
  }

  Future<String?> getWifiIP() async {
    try{
      var wifiIP = await networkInfo.getWifiIP();
      return wifiIP;
    } on PlatformException catch (exception) {
      return "不支持显示";
    }
  }

  Future<String?> getWifiGatewayIP() async {
    try{
      var wifiGatewayIP = await networkInfo.getWifiGatewayIP();
      return wifiGatewayIP;
    } on PlatformException catch (exception) {
      return "不支持显示";
    }
  }
}