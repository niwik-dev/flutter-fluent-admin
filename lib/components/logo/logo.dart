import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'logo.g.dart';

@swidget
Widget logo(){
  return const Text(
    'Fluent UI',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );
}