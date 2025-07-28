import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_admin/store/widget/widget_store.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart' as md;

part 'app_bar.g.dart';

class GlobalWindowListener with WindowListener{
  late ProviderContainer container;

  GlobalWindowListener(BuildContext context){
    container = ProviderScope.containerOf(context);
  }

  @override
  void onWindowMaximize() {
    container.read(widgetStateStoreProvider.notifier).setMaximized(true);
    super.onWindowMaximize();
  }

  @override
  void onWindowUnmaximize() {
    container.read(widgetStateStoreProvider.notifier).setMaximized(false);
    super.onWindowUnmaximize();
  }
}


@hcwidget
Widget controlButtons(BuildContext context,WidgetRef ref){
  var widgetState = ref.watch(widgetStateStoreProvider);

  windowManager.addListener(
    GlobalWindowListener(context)
  );

  void showCloseDialog(BuildContext context) async{
    await showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: Text(
            '你确定要退出应用程序吗?',
            style: FluentTheme.of(context).typography.title
          ),
          content: const Text(
            '如果确定要退出，你的所有未保存数据将丢失。',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            Button(
              child: const Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FilledButton(
              child: const Text('退出'),
              onPressed: () {
                windowManager.close();
                exit(0);
              },
            )
          ]
        );
      }
    );
  }

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: const Icon(
          md.Icons.minimize,
          size: 20,
        ),
        onPressed: () {
          windowManager.minimize();
        },
      ), // 最小化按钮
      IconButton(
        icon: Icon(
          widgetState.isMaximized?md.Icons.zoom_in_map_rounded  :md.Icons.zoom_out_map_rounded,
          size: 20,
        ),
        onPressed: () async {
          if (await windowManager.isMaximized()) {
            windowManager.unmaximize();
          } else {
            windowManager.maximize();
          }
        },
      ), // 最大化/恢复按钮
      IconButton(
        icon: const Icon(
          md.Icons.close,
          size: 20,
        ),
        style: ButtonStyle(
            foregroundColor: WidgetStateColor.resolveWith((state){
              if (state.isHovered) {
                return Colors.white;
              } else {
                return FluentTheme.of(context).iconTheme.color!;
              }
            }),
            backgroundColor: WidgetStateColor.resolveWith((state){
              if (state.isHovered) {
                return Colors.red;
              } else {
                return Colors.transparent;
              }
            })
        ), // 关闭按钮
        onPressed: () {
          showCloseDialog(context);
        }
      ),
      const SizedBox(width: 16)
    ]
  );
}

NavigationAppBar buildDraggableNavigationBar(
  BuildContext context,{required String title}
) {
  // 判断是否是PC端，注意：kIsWeb需要预先判断，因为Web平台引入Platform会报错
  bool isPC = !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

  // 标题内容：文本内容+Logo图标
  Widget titleContent = Row(
    children: [
      Text(
        title,
        style: FluentTheme.of(context).typography.bodyStrong,
      ),
    ]
  );

  return NavigationAppBar(
    // PC端使用DragToMoveArea组件，移动时保持标题栏固定
    // 移动端和Web端使用默认标题栏
    title: isPC? DragToMoveArea(
      child: titleContent,
    ):titleContent,

    // PC端使用自定义的标题栏按钮
    actions: isPC ? const Align(
      alignment: Alignment.centerRight,
      child: ControlButtons()
    ):null,
  );
}