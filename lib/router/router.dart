import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/pages/ai_chat/ai_chat_page.dart';
import 'package:flutter_admin/pages/error/error_page.dart';
import 'package:flutter_admin/pages/index/index_page.dart';
import 'package:go_router/go_router.dart';

import '../pages/message/message_page.dart';
import '../pages/short_video/short_video_page.dart';
import '../router/navigation/route.dart';
import '../layout/layout.dart';
import '../pages/help/help_page.dart';
import '../pages/login/login_page.dart';
import '../pages/login/register_page.dart';
import '../pages/setting/setting_page.dart';

class AppRouter{
  static GoRouter router = buildAppRouter();

  static GoRouter buildAppRouter() {
    return GoRouter(
        initialLocation: '/',
        errorPageBuilder: (context, state) => CustomTransitionPage<void>(
          child: const ErrorPage(),
          barrierColor: FluentTheme.of(context).micaBackgroundColor,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity:
              CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
        routes: [
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) =>
              CustomTransitionPage(
                child: const LoginPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  );
                },
              ),
          ),
          GoRoute(
            path: '/register',
            pageBuilder: (context, state) =>
              CustomTransitionPage(
                child: const RegisterPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  );
                },
              ),
          ),
          GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
              CustomTransitionPage(
                child: MainLayout(
                  NavigationMenuRoute(
                    items: [
                      PaneItem(
                        title: const Text('仪表盘'),
                        icon: const Icon(FluentIcons.view_dashboard),
                        body: const IndexPage(),
                      ),
                      PaneItem(
                        title: const Text('AI助手'),
                        icon: const Icon(FluentIcons.chat_bot),
                        body: const AiChatPage(),
                      ),
                      PaneItem(
                        title: const Text('短视频'),
                        icon: const Icon(FluentIcons.video),
                        body: const ShortVideoPage(),
                      ),
                      PaneItem(
                        title: const Text('消息'),
                        icon: const Icon(FluentIcons.message),
                        body: const MessagePage(),
                      )
                    ],
                    footerItems: [
                      PaneItem(
                        icon: const Icon(FluentIcons.settings),
                        title: const Text('设置'),
                        body: const SettingPage(),
                      ),
                      PaneItem(
                        icon: const Icon(FluentIcons.help),
                        title: const Text('帮助'),
                        body: const HelpPage(),
                      ),
                    ]
                  )
                ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                    child: child,
                  );
                },
              )
          ),
        ]
    );
  }
}