import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/store/app_info.dart';
import '../components/app_bar/app_bar.dart';
import '../router/navigation/route.dart';
import '../store/app/app_store.dart';
import '../store/login/login_store.dart';

part 'layout.g.dart';

@hcwidget
Widget mainLayout(BuildContext context,WidgetRef ref,NavigationMenuRoute route) {
  var tabs = useState<List<Tab>>(<Tab>[]);                      // 标签列表，Tab继承于Widget
  var tabTitles = useState<List<String>>(<String>[]);           // 标签标题
  var selectedIndex = useState<int>(0);                         // 当前选中的标签索引
  var currentTabIndex = useState<int>(0);                       // 当前标签索引
  var appSettings = ref.watch(appSettingsStoreProvider);        // 应用全局设置

  void handleOnItemPressed(int index) { 
    // 点击后，左边侧边栏选择到对应选项（默认行为）
    selectedIndex.value = index;

    NavigationPaneItem paneItem;
    // 获取对应的paneItem
    if(index < route.items.length){
      paneItem = route.items[index];
    }else{
      paneItem = route.footerItems[index-route.items.length];
    }
    if(paneItem is PaneItem){
      // 因为菜单项的标题是Text，所以这里判断一下
      if(paneItem.title is! Text){
        throw Exception('PaneItem title must be Text');
      }
      var titleWidget = (paneItem.title as Text);
      var title = titleWidget.data!;
      if (tabTitles.value.contains(title)) {
        currentTabIndex.value = tabTitles.value.indexOf(title);
        return;
      }
      currentTabIndex.value = tabs.value.length;
      tabTitles.value.add(title);
      tabs.value.add(
        Tab(
          text: paneItem.title!,
          icon: paneItem.icon,
          body: paneItem.body,
          onClosed: () {
            int tabIndex = tabTitles.value.indexOf(title);

            if(tabIndex != -1) {
              tabTitles.value.removeAt(tabIndex);
              tabs.value.removeAt(tabIndex);
            }

            if(tabIndex == 0 && currentTabIndex.value == 0){
              return;
            }
            else if(tabIndex <= currentTabIndex.value){
              currentTabIndex.value = currentTabIndex.value-1;
            }
          }
        )
      );
    }
  }

  useEffect((){
    // 默认打开第一个标签页
    handleOnItemPressed(0);
    return null;
  },[]);

  return NavigationView(
    appBar: buildDraggableNavigationBar(
      context,
      title:AppInfo.instance.appTitle
    ),
    paneBodyBuilder: (index, body) {
      return TabPaneBody(
        tabIndex:currentTabIndex,
        tabs:tabs
      );
    },
    pane: NavigationPane(
      // 自定义侧边栏长宽属性
      size: const NavigationPaneSize(
        openMaxWidth: 240
      ),
      displayMode: appSettings.paneDisplayMode,
      selected: selectedIndex.value,
      // header: const UserAvatar(),
      items: route.items,
      footerItems: route.footerItems,
      onItemPressed: handleOnItemPressed,
      autoSuggestBoxReplacement: const Icon(
        FluentIcons.search,
      ),
      autoSuggestBox: AutoSuggestBox(
        leadingIcon: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Icon(
            FluentIcons.search,
            size: 16,
          ),
        ),
        placeholder: '搜索',
        // 搜索点击联想项跳转页面
        onSelected: (suggestBoxItem) {
          (route.items+route.footerItems)
            .whereType<PaneItem>()
            .firstWhere((paneItem) => (paneItem.title as Text).data == suggestBoxItem.value)
            .onTap!();
        },
        items: route.getAutoSuggestBoxItems(),
      ),
    ),
  );
}

/*
 * 侧边栏用户头像
*/
@hcwidget
Widget userAvatar(BuildContext context,WidgetRef ref) {
  final loginUser = ref.watch(loginUserStoreProvider);

  return Container(
    margin: const EdgeInsets.only(
      top: 16, bottom: 16,
    ),
    child: ListTile(
      onPressed: (){},
      leading: loginUser.avatarUrl == null ?
      const CircleAvatar(
        radius: 28,
        child: Icon(
          FluentIcons.contact,
          size: 28
        )
      ):
      CircleAvatar(
        radius: 28,
        backgroundImage: NetworkImage(loginUser.avatarUrl!),
      ),
      title: Text(
        loginUser.username,
        style: FluentTheme.of(context).typography.bodyLarge,
      ),
      subtitle: Text(
        'Login 10 minutes ago',
        style: FluentTheme.of(context).typography.body,
      ),
      trailing: const Icon(FluentIcons.chevron_right)
    )
  );
}

@hwidget
Widget tabPaneBody({
  required ValueNotifier<int> tabIndex,
  required ValueNotifier<List<Tab>> tabs
}){

  return ScaffoldPage(
    padding: EdgeInsets.zero,
    content: Card(
      padding: EdgeInsets.zero,
      child: TabView(
        showScrollButtons: true,
        tabWidthBehavior: TabWidthBehavior.equal,
        tabs: tabs.value,
        onChanged: (index) {
          tabIndex.value = index;
        },
        currentIndex: tabIndex.value,
      ),
    ),
  );
}