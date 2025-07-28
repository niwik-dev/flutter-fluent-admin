import 'dart:async';

import 'package:async/async.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/service/system_info/service_info_service.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';

part 'p_memory_view.g.dart';

@hwidget
Widget pageMemoryView(BuildContext context){
  SystemInfoService service = SystemInfoService();
  var isDataFetched = useState<bool>(false);
  var memoryUsed = useState<int>(0);
  var memoryFree = useState<int>(0);

  useEffect(() {
    var firstLoad = CancelableOperation.fromFuture(
      Future.delayed(const Duration(microseconds: 200), () {
        memoryUsed.value = service.getMemoryUsed();
        memoryFree.value = service.getMemoryFree();
        isDataFetched.value = true;
      }),
    );

    // 定时器每10秒钟获取一次内存使用情况
    var timer = Timer.periodic(const Duration(seconds: 10), (_) {
      memoryUsed.value = service.getMemoryUsed();
      memoryFree.value = service.getMemoryFree();
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
                value: memoryUsed.value.toDouble(),
                gradient: SweepGradient(
                  colors: [
                    FluentTheme.of(context).accentColor.lighter,
                    FluentTheme.of(context).accentColor.darker,
                    FluentTheme.of(context).accentColor.lighter,
                  ]
                ),
                title: service.formatByte(memoryUsed.value),
                titlePositionPercentageOffset: 2.5,
                radius: 12,
              ),
              PieChartSectionData(
                value: memoryFree.value.toDouble(),
                color: Colors.transparent,
                title: service.formatByte(memoryFree.value),
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
              service.getMemoryUsedPercent(),
              style: const TextStyle(
                fontSize: 24
              ),
            ),
            const Text(
              '内存占用',
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
          "正在获取内存数据...",
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

ResponsiveColumn buildPageMemoryViewInColumn(BuildContext context){ 
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
      child: const PageMemoryView(),
    )
  );
}