import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:media_kit/media_kit.dart';

import 'router/router.dart';
import 'store/app/app_store.dart';
import 'utils/window_utils.dart';

part 'main.g.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WindowUtils.initialize();
  MediaKit.ensureInitialized();
  runApp(const ProviderScope(
    child: DashboardApp(),
  ));
}

@cwidget
Widget dashboardApp(WidgetRef ref){
  final appSettings = ref.watch(appSettingsStoreProvider);

  return FluentApp.router(
    debugShowCheckedModeBanner: false,
    title: 'FluentUI Dashboard',
    theme: FluentThemeData(
      brightness: appSettings.darkMode?Brightness.dark:Brightness.light,
      accentColor: appSettings.accentColor,
      fontFamily: 'fc-regular'
    ),
    routerConfig: AppRouter.router,
  );
}
