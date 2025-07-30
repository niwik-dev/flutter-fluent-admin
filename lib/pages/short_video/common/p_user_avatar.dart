import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'p_user_avatar.g.dart';

@swidget
Widget networkVideoAuthorAvatar(BuildContext context, {required String avatarUrl}){ 
  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: 2,
      )
    ),
    child: CircleAvatar(
      backgroundImage: NetworkImage(
        avatarUrl
      )
    ),
  );
}

@swidget
Widget defaultVideoAuthorAvatar(BuildContext context){ 
  return Container(
    margin: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      border: Border.all(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: 2,
      )
    ),
    child: Icon(
      FluentIcons.accounts,
      size: 36,
      color: FluentTheme.of(context).accentColor,
    )
  );
}