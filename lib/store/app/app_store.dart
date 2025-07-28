import 'package:fluent_ui/fluent_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../model/store/app_settings.dart';

part 'app_store.g.dart';

@riverpod
class AppSettingsStore extends _$AppSettingsStore{
  @override
  AppSettings build() {
    return AppSettings();
  }

  void setDarkMode(bool value){
    state = state.copyWith(darkMode: value);
  }

  void setPaneDisplayMode(PaneDisplayMode value) {
    state = state.copyWith(paneDisplayMode: value);
  }

  void setAccentColor(AccentColor value) {
    state = state.copyWith(accentColor: value);
  }

  void resetSettings(){
    state = AppSettings();
  }
}