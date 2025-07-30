import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_admin/api/restful/auth_api.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_manager/window_manager.dart';

import '../../model/store/app_info.dart';
import '../../components/app_bar/app_bar.dart';
import '../../store/login/login_store.dart';
import 'common/p_auth_page_bg.dart';

part 'login_page.g.dart';

@hcwidget
Widget loginForm(BuildContext context,WidgetRef ref){
  var username = useState<String>('');
  var password = useState<String>('');
  var captcha = useState<String>('');
  var rememberLogin = useState<bool>(false);
  var captchaImage = useState<Image?>(null);

  AuthApi authApi = AuthApi();

  useEffect((){
    authApi.fetchCaptcha().then(
      (image) {
        captchaImage.value = image;
      }
    );
  },[]);

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
                text: '登录\n'
              ),
              TextSpan(
                text: '欢迎使用！',
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
              '还没有账号?',
              style: FluentTheme.of(context).typography.body,
            ),
            const SizedBox(width: 4),
            HyperlinkButton(
              child: Text(
                '创建账号',
                style: FluentTheme.of(context).typography.body,
              ),
              onPressed: () {
                context.go('/register');
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
                  captcha.value = value;
                },
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              child: SizedBox(
                width: 120,
                height: 30,
                child: captchaImage.value ?? const Placeholder(),
              ),
              onTap: () {
                // 刷新验证码
                authApi.fetchCaptcha().then(
                  (image) {
                    captchaImage.value = image;
                  }
                );
              },
            )
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              content: Text(
                '记住登录',
                style: FluentTheme.of(context).typography.body,
              ),
              checked: rememberLogin.value,
              onChanged: (bool? value) {
                rememberLogin.value = value!;
              },
            ),
            const Spacer(),
            HyperlinkButton(
              child: Text(
                '忘记密码?',
                style: FluentTheme.of(context).typography.body,
              ),
              onPressed: () {  },
            )
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            child: Text(
              '登录',
              style: FluentTheme.of(context).typography.body,
            ),
            onPressed: () async {
              // 这边模拟登录过程，调用接口
              bool success = await authApi.login(
                username: username.value,
                password: password.value,
                captcha: captcha.value,
              );
              if(success){
                context.go('/');
              }else{
                showDialog(
                  context: context,
                  builder: (context) {
                    return ContentDialog(
                      title: const Text('登录失败'),
                      content: const Text('用户名或密码错误'),
                      actions: [
                        Button(
                          child: const Text('确定'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ]
                    );
                  }
                );
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
Widget loginPage(BuildContext context){
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
                AppInfo.instance.appName,
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
              child: LoginForm(),
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