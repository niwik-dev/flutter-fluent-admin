import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_admin/pages/login/common/p_auth_page_bg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import '../../components/app_bar/app_bar.dart';
import '../../store/login/login_store.dart';

part 'register_page.g.dart';


@hcwidget
Widget registerForm(BuildContext context,WidgetRef ref){
  var username = useState<String>('');
  var password = useState<String>('');
  // ignore: unused_local_variable
  var rememberLogin = useState<bool>(false);

  return SizedBox(
    width: 420,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: FluentTheme.of(context).typography.titleLarge,
            children: [
              const TextSpan(
                text: '注册账户\n'
              ),
              TextSpan(
                text: '填写个人信息',
                style: TextStyle(
                  color: FluentTheme.of(context).accentColor,
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '已经有账户了?',
              style: FluentTheme.of(context).typography.body,
            ),
            const SizedBox(width: 4),
            HyperlinkButton(
              child: Text(
                '登录账户',
                style: FluentTheme.of(context).typography.body,
              ),
              onPressed: () {
                context.go('/login');
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        TextBox(
          placeholder: '用户名',
          prefix: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              FluentIcons.contact,
              size: 16,
            ),
          ),
          style: FluentTheme.of(context).typography.body,
          onChanged: (value) {
            username.value = value;
          },
        ),
        const SizedBox(height: 16),
        PasswordBox(
          revealMode: PasswordRevealMode.peekAlways,
          showCursor: true,
          placeholder: '密码',
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              FluentIcons.lock,
              size: 16,
            ),
          ),
          style: FluentTheme.of(context).typography.body,
          onChanged: (value) {
            password.value = value;
          },
        ),
        const SizedBox(height: 16),
        PasswordBox(
          revealMode: PasswordRevealMode.peekAlways,
          showCursor: true,
          placeholder: '确认密码',
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(
              FluentIcons.lock,
              size: 16,
            ),
          ),
          style: FluentTheme.of(context).typography.body,
          onChanged: (value) {
            password.value = value;
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextBox(
                placeholder: '验证码',
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    FluentIcons.contact,
                    size: 16,
                  ),
                ),
                style: FluentTheme.of(context).typography.body,
                onChanged: (value) {
                  username.value = value;
                },
              ),
            ),
            const SizedBox(width: 16),
            Container(
              width: 120,
              height: 30,
              child: Placeholder(),
            )
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            child: Text(
              '注册',
              style: FluentTheme.of(context).typography.body,
            ),
            onPressed: () {
              // 注册业务逻辑

              context.go('/login');
              var loginUser = ref.read(loginUserStoreProvider);
              loginUser.isLoggedIn = true;
              if(username.value!=''){
                loginUser.username = username.value;
              }
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: Button(
            child: Text(
              '退出',
              style: FluentTheme.of(context).typography.body,
            ),
            onPressed: () {
              windowManager.close();
              exit(0);
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    ),
  );
}

@hwidget
Widget registerPage(BuildContext context){
  var isPC = (!kIsWeb) && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);
  var isMobile = (!kIsWeb) && (Platform.isAndroid || Platform.isIOS);

  var pageContent =  DecoratedBox(
    decoration: BoxDecoration(
      color: FluentTheme.of(context).micaBackgroundColor
    ),
    child: ScaffoldPage(
      padding: EdgeInsets.zero,
      header: PageHeader(
        padding: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 24, top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Fluent Design',
                style: FluentTheme.of(context).typography.subtitle,
              ),
              const Spacer(),
              isPC?const ControlButtons(): const SizedBox.shrink()
            ],
          ),
        )
      ),
      content: AuthPageBackground(
        child: Align(
          alignment: const Alignment(-0.5, 0),
          child: Acrylic(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            blurAmount: 4,
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: RegisterForm(),
            ),
          )
        ),
      )
    ),
  );

  return isPC ?DragToMoveArea(
    child: pageContent,
  ): isMobile? SafeArea(
    child: pageContent
  ):pageContent;
}