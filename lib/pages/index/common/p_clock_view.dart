import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_admin/utils/date_utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

import 'p_title_card.dart';

part 'p_clock_view.g.dart';

@hwidget
Widget pageClockView(BuildContext context){
  var nowTime = useState<DateTime>(DateTime.now());

  useEffect((){
    var timer = Timer.periodic(Duration(seconds: 1),(_){
      //更新
      nowTime.value = DateTime.now();
    });
    return (){
      timer.cancel();
    };
  },[]);

  return Wrap(
    alignment: WrapAlignment.center,
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 32,
    runSpacing: 16,
    children: [
      LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth>420 ? 120 : 100,
            child: const AnalogClock(),
          );
        },
      ),
      LayoutBuilder(
        builder: (context, constraints) {
          return  Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                "${UserDateUtils.format(
                  nowTime.value,
                  format: "yyyy年MM月dd日"
                )} ${UserDateUtils.formatDayOfWeek(nowTime.value)}",
                style: TextStyle(
                  fontSize: constraints.maxWidth > 420 ? 20 : 16
                ),
              ),
              Text(
                UserDateUtils.format(nowTime.value, format: "HH:mm:ss"),
                style: TextStyle(
                  fontSize: constraints.maxWidth > 420 ? 56 : 36
                ),
              ),
            ],
          );
        }
      )
    ],
  );
}

ResponsiveColumn buildPageClockViewInColumn(BuildContext context){
  return ResponsiveColumn.span(
    span: ResponsiveLayout.value(
      context,
      Breakpoints(
        xs: 12,
        sm: 12,
        md: 6,
        lg: 6
      )
    ),
    child: TitleCard(
      title: '时钟',
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(24),
        child: const Center(
          child: PageClockView(),
        ),
      ),
    )
  );
}