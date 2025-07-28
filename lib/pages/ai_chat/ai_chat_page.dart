import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/service/ai_chat/ai_chat_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/store/ai_chat.dart';
import '../../store/ai_chat/ai_chat_store.dart';
import '../../utils/date_utils.dart';
import 'common/p_chat_input.dart';
import 'common/p_chat_bubble.dart';

part 'ai_chat_page.g.dart';

@hcwidget
Widget aiChatPage(BuildContext context,WidgetRef ref) {
  /**
   * https://github.com/bdlukaa/fluent_ui/issues/1083
   * issue #1083 输入框聚焦问题
   * 解决方案：NavigationPane设置selected: 0
   */
  AiChatService aiChatService = AiChatService(ref);
  var aiChatHistory = ref.watch(aiChatHistoryStoreProvider);
  var aiChatHistoryNotifier = ref.watch(aiChatHistoryStoreProvider.notifier);

  var selectedPaneIndex = useState<int>(0);


  return NavigationView(
    pane: NavigationPane(
      selected: selectedPaneIndex.value,
      displayMode: PaneDisplayMode.auto,
      // 自定义聊天助手侧边栏长宽属性
      size: const NavigationPaneSize(
        openMaxWidth: 280
      ),
      onItemPressed: (index) {
        selectedPaneIndex.value = index;
      },
      header: const SizedBox(height: 16),
      items: [
        PaneItem(
          title: const Text('开启新对话'),
          icon: const Icon(FluentIcons.open_in_new_window),
          body: ChatNewSubPage(
            onNewChat: (String content,bool isDeepThink, bool isInternetSearch){

              // 新增空会话
              var currentSession = Session(
                title: '新对话',
                messages: []
              );

              currentSession.addMessages([
                SessionMessage(
                  content: content,
                  role: 'user',
                ),
                SessionMessage(
                  content: '思考中...',
                  role: 'assistant',
                )
              ]);
              aiChatHistoryNotifier.saveSession(currentSession);

              // 跳转到第一个聊天会话界面
              selectedPaneIndex.value = 1;

              // 生成对话内容
              aiChatService.makeNewChat(
                session: currentSession,
                content: content,
                isDeepThink: isDeepThink,
                isInternetSearch: isInternetSearch,
              );

              // 生成会话标题内容
              aiChatService.renameNewChat(
                session: currentSession,
                content: content
              );
            },
          ),
          onTap: () {
            selectedPaneIndex.value = 0;
          },
        ),
        for(int index=0;index < aiChatHistory.length;++index)
        ...[
          if(
            index == 0 ||
            UserDateUtils.formatAsFuzzyDate(
              aiChatHistory[index].createTime
            ) != UserDateUtils.formatAsFuzzyDate(
              aiChatHistory[index-1].createTime
            )
          )
          PaneItemHeader(
            header: Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8),
              child: Text(
                UserDateUtils.formatAsReableDay(aiChatHistory[index].createTime),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          PaneItem(
            title: Text(
              aiChatHistory[index].title
            ),
            icon: const Icon(FluentIcons.chat),
            body: ChatHistorySubPage(
              aiChatHistory[index].uuid,
            )
          )
        ]
      ]
    ),
  );
}


/*
  开始新聊天的子页面
*/
@swidget
Widget chatNewSubPage(
  BuildContext context,
  {
    required dynamic Function(String,bool,bool) onNewChat
  }
){
  
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Wrap(
        direction: Axis.horizontal,
        children: [
          Text(
            '我是 AI聊天助手 ，很高兴认识你！',
            style: TextStyle(
              fontSize: 28
            ),
          )
        ],
      ),
      const SizedBox(height: 8),
      const Text(
        '我可以帮你写代码、读文件、写作各种创意内容，请把你的任务交给我吧~'
      ),
      const SizedBox(height: 16),
      ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 720
        ),
        child: ChatInput(
          onNewChat: onNewChat,
        ),
      )
    ],
  );
}

/// 聊天历史界面的固定首部栏
class ChatHistoryHeaderBarDelegate extends SliverPersistentHeaderDelegate{
  final double fixedHeight = 50;

  late String title;

  ChatHistoryHeaderBarDelegate({required this.title});
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FluentTheme.of(context).acrylicBackgroundColor,
      ),
      child: Center(
        child: Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 8,
          children: [
            const Icon(
              FluentIcons.chat_solid,
              size: 14,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => fixedHeight;

  @override
  double get minExtent => fixedHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  
}

/// 聊天历史界面 子页面
@hcwidget
Widget chatHistorySubPage(
  BuildContext context,
  WidgetRef ref,
  String sessionUuidId
){
  AiChatService aiChatService = AiChatService(ref);
  var aiChatHistoryNotifier = ref.read(aiChatHistoryStoreProvider.notifier);
  Session? session = aiChatHistoryNotifier.getSession(sessionUuidId);
  
  return Stack(
    children: [
      CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: ChatHistoryHeaderBarDelegate(
              title: session?.title ?? '无标题',
            ),
          ),

          for(var message in session?.messages ?? [])
          SliverToBoxAdapter(
            child: ChatBubble(
              text: (message.content!).trim(),
              isUser: message.role == 'user',
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 200),
          )
        ],
      ),

      Align(
        alignment: const Alignment(0, 0.85),
        child: ChatInput(
          onNewChat: (String content, bool isDeepThink, bool isInternetSearch) {
            session!.addMessages([
              SessionMessage(
                content: content,
                role: 'user',
              ),
              SessionMessage(
                content: '思考中...',
                role: 'assistant',
              )
            ]);
            aiChatHistoryNotifier.saveSession(session);

            aiChatService.makeNewChat(
              session: session,
              content: content,
              isDeepThink: isDeepThink,
              isInternetSearch: isInternetSearch,
            );
          },
        )
      )
    ],
  );
}