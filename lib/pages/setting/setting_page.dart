import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../store/app/app_store.dart';

part 'setting_page.g.dart';

@hcwidget
Widget settingPage(BuildContext context,WidgetRef ref) {
  var appSettings = ref.watch(appSettingsStoreProvider);
  var appSettingsNotifier = ref.read(appSettingsStoreProvider.notifier);

  var themeColorItemExpanded = useState<bool>(false);
  final themeColorFlyoutController = FlyoutController();
  var allowNotifications = useState<bool>(true);
  var allowLocation = useState<bool>(true);
  var navigationIndicator = useState<PaneDisplayMode>(appSettings.paneDisplayMode);

  void showBackToDefaultDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: Text(
            '恢复初始配置',
            style: FluentTheme.of(context).typography.title,
          ),
          content: Text(
            '你确定要恢复到初始配置吗?',
            style: FluentTheme.of(context).typography.body,
          ),
          actions: [
            FilledButton(
              child: const Text('确定'),
              onPressed: () {
                appSettingsNotifier.resetSettings();
                Navigator.of(context).pop();
              }
            ),
            Button(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  void showClearCacheDialog() async{
    await showDialog(
      context: context,
      builder: (context) {
        return ContentDialog(
          title: const Text('提示'),
          content: const Text('确定要清除缓存吗？'),
          actions: [
            FilledButton(
              child: const Text('确定'),
              onPressed: () {
                appSettingsNotifier.resetSettings();
                Navigator.of(context).pop();
              }
            ),
            Button(
              child: const Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
    );
  }

  return ScaffoldPage(
    header: PageHeader(
      title: Text(
        '设置',
        style: FluentTheme.of(context).typography.title,
      ),
      commandBar: CommandBar(
        mainAxisAlignment: MainAxisAlignment.end,
        primaryItems: [
          CommandBarButton(
            icon: const Icon(FluentIcons.reset),
            label: const Text('重置到初始设置'),
            onPressed: () {
              showBackToDefaultDialog();
            },
          )
        ],
      ),
    ),
    content: Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Card(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Icon(
                appSettings.darkMode ? FluentIcons.clear_night :FluentIcons.sunny,
                size: 32,
              ),
              title: Text(
                '夜间模式',
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              subtitle: Text(
                  '改变应用程序主题模式',
                  style: FluentTheme.of(context).typography.body
              ),
              trailing: ToggleSwitch(
                checked: appSettings.darkMode,
                onChanged: (value){
                  appSettingsNotifier.setDarkMode(value);
                }
              ),
            ),
          ),
          Card(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                FluentIcons.context_menu,
                size: 32,
              ),
              title: Text(
                '导航栏模式',
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              subtitle: Text(
                  '选择导航栏模式',
                  style: FluentTheme.of(context).typography.body
              ),
              trailing: ComboBox<PaneDisplayMode>(
                value: navigationIndicator.value,
                items: const [
                  ComboBoxItem(
                    value: PaneDisplayMode.auto,
                    child: Text('自动'),
                  ),
                  ComboBoxItem(
                    value: PaneDisplayMode.compact,
                    child: Text('紧凑'),
                  ),
                  ComboBoxItem(
                    value: PaneDisplayMode.minimal,
                    child: Text('最小化'),
                  ),
                  ComboBoxItem(
                    value: PaneDisplayMode.open,
                    child: Text('宽敞'),
                  )
                ],
                onChanged: (value){
                  navigationIndicator.value = value!;
                  appSettingsNotifier.setPaneDisplayMode(value);
                },
              )
            ),
          ),
          Card(
            padding: EdgeInsets.zero,
            child: Expander(
              contentPadding: EdgeInsets.zero,
              headerBackgroundColor: WidgetStateProperty.resolveWith<Color>((state){
                if(state.isHovered){
                  return FluentTheme.of(context).cardColor;
                }
                return Colors.transparent;
              }),
              icon: RotatedBox(
                quarterTurns: themeColorItemExpanded.value ? 1 : 0,
                child: const Icon(
                  FluentIcons.chevron_right,
                  size: 18
                ),
              ),
              onStateChanged: (state){
                themeColorItemExpanded.value = state;
              },
              header: ListTile(
                contentPadding: const EdgeInsets.only(
                  right: 16, top: 16, bottom: 16
                ),
                leading: const Icon(
                  FluentIcons.color,
                  size: 32,
                ),
                title: Text(
                  '主题样式',
                  style: FluentTheme.of(context).typography.bodyStrong,
                ),
                subtitle: Text(
                    '自定义应用程序主题样式',
                    style: FluentTheme.of(context).typography.body
                ),
              ),
              content: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: const Text('主题色设置'),
                    leading: const Icon(
                      FluentIcons.color,
                      size: 32,
                    ),
                    trailing: FlyoutTarget(
                      controller: themeColorFlyoutController,
                      child: GestureDetector(
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: FluentTheme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        onTap: (){
                          themeColorFlyoutController.showFlyout(
                            builder: (context){
                              return FlyoutContent(
                                child: ColorPicker(
                                  colorSpectrumShape: ColorSpectrumShape.box,
                                  color: appSettings.accentColor==null?Colors.blue:appSettings.accentColor!.toAccentColor(),
                                  onChanged: (color){
                                    var accentColor = AccentColor.swatch(
                                      {
                                        'normal': color,
                                      }
                                    );
                                    appSettingsNotifier.setAccentColor(accentColor);
                                  },
                                ),
                              );
                            }
                          );
                        },
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
          Card(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                FluentIcons.message,
                size: 32,
              ),
              title: Text(
                '通知',
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              subtitle: Text(
                  '允许接受通知',
                  style: FluentTheme.of(context).typography.body
              ),
              trailing: ToggleSwitch(
                  checked: allowNotifications.value,
                  onChanged: (value){
                    allowNotifications.value = value;
                  }
              ),
            ),
          ),
          Card(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                FluentIcons.location,
                size: 32,
              ),
              title: Text(
                '定位',
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              subtitle: Text(
                '允许使用位置',
                style: FluentTheme.of(context).typography.body
              ),
              trailing: ToggleSwitch(
                checked: allowLocation.value,
                onChanged: (value){
                  allowLocation.value = value;
                }
              ),
            ),
          ),
          Card(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                FluentIcons.page_remove,
                size: 32,
              ),
              title: Text(
                '清除缓存',
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              subtitle: Text(
                '这将删除所有缓存数据',
                style: FluentTheme.of(context).typography.body
              ),
              trailing: const Icon(
                FluentIcons.chevron_right,
                size: 18,
              ),
              onPressed: (){
                showClearCacheDialog();
              },
            ),
          ),
          Card(
            padding: EdgeInsets.zero,
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: const Icon(
                FluentIcons.release_gate,
                size: 32,
              ),
              title: Text(
                '退出登录',
                style: FluentTheme.of(context).typography.bodyStrong,
              ),
              subtitle: Text(
                  '登出当前账户',
                  style: FluentTheme.of(context).typography.body
              ),
              trailing: const Icon(
                FluentIcons.chevron_right,
                size: 18,
              ),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return ContentDialog(
                      title: Text(
                        '退出登录',
                        style: FluentTheme.of(context).typography.title,
                      ),
                      content: Text(
                        '你确定要退出登录?',
                        style: FluentTheme.of(context).typography.body,
                      ),
                      actions: [
                        FilledButton(
                          child: const Text('确认'),
                          onPressed: () {
                            // appSettings.resetSettings();
                            context.pop();
                            context.go('/login');
                          }
                        ),
                        Button(
                          child: const Text('取消'),
                          onPressed: () {
                            context.pop();
                          }
                        )
                      ]
                    );
                  }
                );
              },
            ),
          ),
        ],
      ),
    )
  );
}