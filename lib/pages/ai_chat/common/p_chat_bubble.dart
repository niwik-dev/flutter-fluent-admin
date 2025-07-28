import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

part 'p_chat_bubble.g.dart';

@swidget
Widget chatBubble(
  BuildContext context,
  {
    required String text,
    bool isUser = false,
  }
){
  
  BorderRadiusGeometry getBorderRadius(bool isUser){
    if(isUser){ 
      return const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      );
    } else{ 
      return const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      );
    }
  }

  Widget buildBubble(String text, bool isUser){
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Wrap(
        alignment: isUser?WrapAlignment.end:WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          DecoratedBox(     
            decoration: BoxDecoration(
              color: isUser?FluentTheme.of(context).accentColor : FluentTheme.of(context).cardColor,
              borderRadius: getBorderRadius(
                isUser
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8, left: 16, right: 16, bottom: 8
              ),
              child: GptMarkdown(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  
  Widget buildFeedbackButtons(bool isUser){
    return Wrap(
      direction: Axis.horizontal,
      alignment: isUser ? WrapAlignment.end : WrapAlignment.start,
      spacing: 2,
      children: [
        IconButton(
          onPressed: (){
            Clipboard.setData(
              ClipboardData(text: text)
            );
            // 短暂显示复制成功
          },
          icon: Icon(
            FluentIcons.copy,
            size: 18,
            color: FluentTheme.of(context).brightness.isDark? Colors.grey[100]: Colors.grey[150],
          ),
        ),
        if(!isUser)
        IconButton(
          onPressed: () => null,
          icon: Icon(
            FluentIcons.like,
            size: 18,
            color: FluentTheme.of(context).brightness.isDark? Colors.grey[100]: Colors.grey[150],
          ),
        ),
        if(!isUser)
        IconButton(
          onPressed: () => null,
          icon: Icon(
            FluentIcons.dislike,
            size: 18,
            color: FluentTheme.of(context).brightness.isDark? Colors.grey[100]: Colors.grey[150],
          )
        )
      ]
    );
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      spacing: 4,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildBubble(text, isUser),
        buildFeedbackButtons(isUser),
      ]
    ),
  );
}