import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';

part 'error_page.g.dart';

@swidget
Widget errorPage(BuildContext context){
  return ScaffoldPage(
    header: const PageHeader(
      title: Wrap(
        direction: Axis.horizontal,
        spacing: 12,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            FluentIcons.status_error_full,
            size: 28,
          ),
          Text('哎呀，出错啦！')
        ],
      ),
    ),
    content: Align(
      alignment: const Alignment(0, -0.5),
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Image.asset(
            'assets/images/404.png',
            width: 320,
            height: 320,
          ),
          const Text(
            '应用程序找不到页面。',
            style: TextStyle(fontSize: 32),
          ),
          const Text(
            '您不必担心，可以选择：',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          Wrap(
            direction: Axis.horizontal,
            spacing: 32,
            children: [
              FilledButton(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2
                  ),
                  child: Text(
                    '返回首页',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                onPressed: (){
                  context.go('/login');
                },
              ),
              Button(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2
                  ),
                  child: Text(
                    '汇报BUG',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                onPressed: (){
                  ;
                },
              )
            ],
          )
        ],
      ),
    ),
  );
}