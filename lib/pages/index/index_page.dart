import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

import '../../pages/index/common/p_network_info_view.dart';
import '../../pages/index/common/p_weather_view.dart';
import '../../pages/index/common/p_calendar_view.dart';
import '../../pages/index/common/p_clock_view.dart';
import '../../pages/index/common/p_memory_view.dart';
import '../../pages/index/common/p_disk_view.dart';
import '../../pages/index/common/p_title_card.dart';
import 'common/p_device_info_view.dart';

part 'index_page.g.dart';

@swidget
Widget indexPage(BuildContext context){
  return ScaffoldPage(
    header: PageHeader(
      title: Text(
        '仪表盘',
        style: FluentTheme.of(context).typography.title,
      ),
    ),
    content: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ResponsiveRow(
            columns: [
              buildPageWeatherInfoViewInColumn(context),
              buildPageClockViewInColumn(context)
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: TitleCard(
            title: '系统信息',
            child: ResponsiveRow(
              columns: [
                buildPageDeviceInfoViewInColumn(context),
                buildPageMemoryViewInColumn(context),
                buildPageDiskViewInColumn(context),
                buildPageNetworkInfoViewInColumn(context),
              ],
            ),
          )
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
            ],
          ),
        ),
      ],
    ),
  );
}