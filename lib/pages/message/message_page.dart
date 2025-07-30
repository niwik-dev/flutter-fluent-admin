import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'message_page.g.dart';

@hcwidget
Widget messagePage(BuildContext context,WidgetRef ref){ 
  return ScaffoldPage(
    header: PageHeader(
      title: Text('消息'),
    ),
    content: Center(
      child: Text('消息'),
    ),
  );
}