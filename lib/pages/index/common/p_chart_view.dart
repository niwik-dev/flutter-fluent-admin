import 'package:fluent_ui/fluent_ui.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:responsive_toolkit/breakpoints.dart';
import 'package:responsive_toolkit/responsive_grid.dart';
import 'package:responsive_toolkit/responsive_layout.dart';

part 'p_chart_view.g.dart';

@swidget
Widget pageChartView(BuildContext context){ 
  return Placeholder();
}

ResponsiveColumn buildPageClockViewInColumn(BuildContext context){
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
      child: const PageChartView(),
    )
  );
}