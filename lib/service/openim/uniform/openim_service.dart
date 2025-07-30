import 'package:flutter_openim_sdk_ffi/flutter_openim_sdk_ffi.dart';

class OpenIMInitializer{
  // 单例模式
  static final OpenIMInitializer _instance = OpenIMInitializer._internal();
  factory OpenIMInitializer() => _instance;
  OpenIMInitializer._internal();
  final String apiAddr = '';
  bool isInit = false;

  Future<void> init() async {
    if(isInit) return;
    await OpenIMManager.init(
      apiAddr: 'http://117.50.162.112:10002',
      wsAddr: 'wss://117.50.162.112:10001',
    );
    isInit = true;
  }
}