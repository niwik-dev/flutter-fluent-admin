import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'p_title_card.g.dart';

@swidget
Widget titleCard(
  BuildContext context,
  {
    required String title,
    required Widget child
  }
){ 
  return Card(
    borderRadius: BorderRadius.circular(8),
    margin: const EdgeInsets.all(16),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            direction: Axis.horizontal,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // 文本装饰, 主题色块
              Container(
                height: 18,
                width: 6,
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: FluentTheme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(8)
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          child
        ]
      )
    )
  );
}