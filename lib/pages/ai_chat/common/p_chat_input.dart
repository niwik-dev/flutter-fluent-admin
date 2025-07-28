import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'p_chat_input.g.dart';

@hwidget
Widget chatInput(
  BuildContext context,
  {
    required dynamic Function(
      String content,bool isDeepThink, bool isInternetSearch
    ) onNewChat
  }
){ 
  var contentController = useTextEditingController();
  var deepThink = useState<bool>(false);
  var internetSearch = useState<bool>(false);

  Widget buildInputBody(){
    return TextBox(
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      expands: false,
      minLines: 1,
      maxLines: 2,
      controller: contentController,
      decoration: WidgetStateProperty.resolveWith(
        (state){
          if(state.isFocused){
            return BoxDecoration(
              color: FluentTheme.of(context).brightness.isDark? Colors.grey[150]: Colors.grey[20],
              borderRadius: BorderRadius.circular(16),
            );
          }else{
            return BoxDecoration(
              color: FluentTheme.of(context).brightness.isDark? Colors.grey[140]: Colors.grey[10],
              borderRadius: BorderRadius.circular(16),
            );
          }
        }
      ),
      onSubmitted: (value) {
        onNewChat(
          value,
          deepThink.value,
          internetSearch.value
        );
      },
      padding: const EdgeInsets.all(16),
      textAlignVertical: TextAlignVertical.top,
      placeholder: '给 AI助手 发送信息',
    );
  }

  Widget buildBottomLeftContent(){
    return Positioned(
      bottom: 16, left: 16,
      child: Wrap(
        children: [
          ToggleButton(
            checked: deepThink.value,
            child: const Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(FluentIcons.date_time),
                SizedBox(width: 4),
                Text('深度思考'),
              ],
            ),
            onChanged: (newState){
              deepThink.value = newState;
            },
          ),
          const SizedBox(width: 16),
          ToggleButton(
            checked: internetSearch.value,
            child: const Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(FluentIcons.my_network),
                SizedBox(width: 4),
                Text('联网搜索'),
              ],
            ),
            onChanged: (newState){
              internetSearch.value = newState;
            },
          )
        ],
      ),
    );
  }

  Widget buildBottomRightContent(){
    return Positioned(
      bottom: 16, right: 16,
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Tooltip(
            style: const TooltipThemeData(
              waitDuration: Duration(
                milliseconds: 200
              )
            ),
            message: '上传附件',
            child: HyperlinkButton(
              style: const ButtonStyle(
                shape: WidgetStatePropertyAll(
                  CircleBorder(),
                )
              ),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(
                  FluentIcons.attach,
                  size: 20,
                ),
              ),
              onPressed: (){},
            ),
          ),
          Tooltip(
            style: const TooltipThemeData(
              waitDuration: Duration(
                milliseconds: 200
              )
            ),
            message: '发送消息',
            child: Button(
              style: const ButtonStyle(
                shape: WidgetStatePropertyAll(
                  CircleBorder(),
                )
              ),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(
                  FluentIcons.up,
                  size: 16,
                ),
              ),
              onPressed: (){
                onNewChat(
                  contentController.text,
                  deepThink.value,
                  internetSearch.value
                );
                contentController.clear();
              },
            ),
          )
        ],
      ),
    );
  }

  return LayoutBuilder(builder: (context, constraints){
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 150,
        maxWidth: constraints.maxWidth*0.8
      ),
      child: Stack(
        children: [
          buildInputBody(),
          buildBottomLeftContent(),
          buildBottomRightContent()
        ],
      ),
    );
  });
}