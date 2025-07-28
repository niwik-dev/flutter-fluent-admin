import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'p_video_loading.g.dart';

@swidget
Widget videoLoading(BuildContext context){
  return Container(
    color: const Color.fromRGBO(0, 0, 0, 1),
    child: Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            "视频加载中",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CircularProgressIndicator(
            color: FluentTheme.of(context).accentColor,
          ),
        ],
      ),
    ),
  );
}