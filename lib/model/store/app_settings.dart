import 'package:fluent_ui/fluent_ui.dart';

class AppSettings {
  bool darkMode = true;                                       // 暗色模式
  PaneDisplayMode paneDisplayMode = PaneDisplayMode.compact;  // 侧边栏显示模式
  AccentColor? accentColor = Colors.blue;                     // 前景色

  AppSettings({
    this.darkMode = true,
    this.paneDisplayMode = PaneDisplayMode.compact,
    this.accentColor,
  });

  AppSettings copyWith({
    bool? darkMode,
    PaneDisplayMode? paneDisplayMode,
    AccentColor? accentColor,
  }){
    return AppSettings(
      darkMode: darkMode ?? this.darkMode,
      paneDisplayMode: paneDisplayMode ?? this.paneDisplayMode,
      accentColor: accentColor ?? this.accentColor,
    );
  }
 }