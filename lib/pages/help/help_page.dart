import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/store/app_info.dart';

part 'help_page.g.dart';

@hcwidget
Widget helpPage(BuildContext context,WidgetRef ref) {

  String buildAppContent(){
    return "当前版本号:${AppInfo.instance.appVersion}";
  }

  return ScaffoldPage(
    header: PageHeader(
      title: Text(
        '帮助',
        style: FluentTheme.of(context).typography.title,
      ),
    ),
    content: Container(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Expander(
            header: Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: const Text(
                  'App信息',
                ),
                subtitle: const Text(
                  '检查更新以及获取App详情'
                ),
                leading: const Icon(
                  FluentIcons.info,
                  size: 32,
                ),
                trailing: FilledButton(
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 8, right: 8, top: 2, bottom: 2
                    ),
                    child: Text('复制内容'),
                  ),
                  onPressed: () {
                    // 复制内容到剪切板
                    Clipboard.setData(
                      ClipboardData(
                        text: buildAppContent(),
                      )
                    );
                  }
                ),
              ),
            ),
            content: ListTile(
              title: const Text('当前版本号'),
              subtitle: Text(AppInfo.instance.appVersion),
              leading: const Icon(
                FluentIcons.info,
                size: 32,
              ),
              trailing: FilledButton(
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 8, right: 8, top: 2, bottom: 2
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(FluentIcons.branch_search),
                      SizedBox(width: 8),
                      Text('检查更新')
                    ],
                  ),
                ),
                onPressed: () async {
                  ;
                }
              ),
            )
          )
        ]
      )
    )
  );
}