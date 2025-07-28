import 'dart:async';
import 'dart:math';

import 'package:async/async.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/service/disk_space/disk_space_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';

part 'p_disk_view.g.dart';

@hwidget
Widget pageDiskView(BuildContext context){
  DiskSpaceService service = DiskSpaceService();
  var isDataFetched = useState<bool>(false);
  var diskTotal = useState<double>(0);
  var diskUsed = useState<double>(0);
  var diskFree = useState<double>(0);

  // 定时器每5秒钟获取一次内存使用情况
  useEffect(() {
    var firstLoad = CancelableOperation.fromFuture(
      Future.delayed(const Duration(seconds: 1),() async{
        diskTotal.value = (await service.getTotalDiskSpace())!;
        diskFree.value = (await service.getFreeDiskSpace())!;
        diskUsed.value = diskTotal.value - diskFree.value;
        isDataFetched.value = true;
      })
    );

    var timer = Timer.periodic(const Duration(seconds: 30), (_) async {
      diskTotal.value = (await service.getTotalDiskSpace())!;
      diskFree.value = (await service.getFreeDiskSpace())!;
      diskUsed.value = diskTotal.value - diskFree.value;
      isDataFetched.value = true;
    });
    // 增加销毁逻辑
    return () {
      firstLoad.cancel();
      timer.cancel();
    };
  }, []);

  return isDataFetched.value?
  Stack(
    children: [
      Center(
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                value: diskUsed.value.toDouble(),
                gradient: SweepGradient(
                  colors: [
                    FluentTheme.of(context).accentColor.lighter,
                    FluentTheme.of(context).accentColor.darker,
                    FluentTheme.of(context).accentColor.lighter,
                  ]
                ),
                title: service.formatVolume(diskUsed.value),
                titlePositionPercentageOffset: 2.5,
                radius: 12,
              ),
              PieChartSectionData(
                value: diskFree.value.toDouble(),
                color: Colors.transparent,
                title: service.formatVolume(diskFree.value),
                titlePositionPercentageOffset: 2.5,
                radius: 12,
              )
            ]
          )
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              '${((diskUsed.value/diskTotal.value)*100.0).toStringAsFixed(2)} %',
              style: const TextStyle(
                fontSize: 24
              ),
            ),
            const Text(
              '硬盘占用',
              style: TextStyle(
                fontSize: 16
              ),
            )
          ],
        )
      )
    ],
  ):
  const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProgressRing(),
        SizedBox(height: 16),
        Text(
          "正在获取硬盘数据...",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

ResponsiveColumn buildPageDiskViewInColumn(BuildContext context){ 
  return ResponsiveColumn.span(
    span: ResponsiveLayout.value(
      context,
      Breakpoints(
        xs: 12,
        sm: 6,
        md: 6,
        lg: 3
      )
    ),
    child: Container(
      padding: const EdgeInsets.all(24),
      height: 200,
      child: const PageDiskView(),
    )
  );
}