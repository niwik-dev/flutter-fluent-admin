import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/store/app/app_store.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'p_auth_page_bg.g.dart';

@cwidget
Widget authPageBackground(BuildContext context,WidgetRef ref,{required Widget child}){
  var appSettings = ref.watch(appSettingsStoreProvider);
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: appSettings.darkMode?
        const AssetImage('assets/images/auth-page/dark-bg.jpg'):
        const AssetImage('assets/images/auth-page/light-bg.jpg'),
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
      ),
    ),
    width: double.infinity,
    height: double.infinity,
    child: child,
  );
}