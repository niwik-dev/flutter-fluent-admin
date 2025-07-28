import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';

class WindowUtils {
  /*
  * 初始化无边框窗体
  * */
  static Future<void> initialize() async {
    bool isPC = !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
    if(!isPC){
      // 移动端或者Web端无法使用，直接退出
      return;
    }
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      size: Size(1260,840),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.hidden,
      alwaysOnTop: false
    );

    // 显示窗口、聚焦和模糊背景
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      await windowManager.blur();
    });

  }
}