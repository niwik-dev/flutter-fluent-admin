// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class MainLayout extends HookConsumerWidget {
  const MainLayout(
    this.route, {
    Key? key,
  }) : super(key: key);

  final NavigationMenuRoute route;

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      mainLayout(
        _context,
        _ref,
        route,
      );
}

class UserAvatar extends HookConsumerWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext _context,
    WidgetRef _ref,
  ) =>
      userAvatar(
        _context,
        _ref,
      );
}

class TabPaneBody extends HookWidget {
  const TabPaneBody({
    Key? key,
    required this.tabIndex,
    required this.tabs,
  }) : super(key: key);

  final ValueNotifier<int> tabIndex;

  final ValueNotifier<List<Tab>> tabs;

  @override
  Widget build(BuildContext _context) => tabPaneBody(
        tabIndex: tabIndex,
        tabs: tabs,
      );
}
