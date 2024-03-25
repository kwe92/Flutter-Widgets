import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets/fl_charts/line_chart_example_view_model.dart';
import 'package:provider/provider.dart';

class LineChartExampleV2 extends StatelessWidget {
  final List<FlSpot> spots;

  const LineChartExampleV2({
    required this.spots,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double maxX = context.watch<LineChartSampleViewModel>().maxX;
    return LineChart(
      LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: 1,
              // getTitlesWidget: bottomTitleWidgets,
              getTitlesWidget: bottomTitleWidgetsWrapper(context, DateTime.now(), maxX),
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: leftTitles(),
          ),
        ),
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 1,
        maxX: maxX,
        maxY: 4,
        minY: 0,
      ),
      duration: const Duration(milliseconds: 250),
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

  /// distribution of title widgets on the y-axis given the max of the y axis specified
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    Widget image;

    switch (value.toInt()) {
      case 0:
        image = Transform.scale(
          scale: 1.5,
          child: SvgPicture.asset(
            "assets/aweful_face.svg",
          ),
        );
        break;

      case 2:
        image = SvgPicture.asset("assets/meh_face.svg");
        break;

      case 4:
        image = SvgPicture.asset("assets/very_happy_face.svg");
        break;
      default:
        return Container();
    }

    return SizedBox(
      height: 20,
      width: 20,
      child: image,
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  /// distribution of title widgets on the x-axis given the max of the x axis specified
  Widget Function(double, TitleMeta) bottomTitleWidgetsWrapper(BuildContext context, DateTime date, double maxX) {
    return (double value, TitleMeta meta) {
      const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
      Widget? text;

      if (maxX == 7) {
        switch (value.toInt()) {
          case 1:
            text = GestureDetector(
              onTap: () {
                context.read<LineChartSampleViewModel>().filterMoodsData(MoodFilter.week);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 42.0),
                child: Text('1 week', style: style),
              ),
            );
            break;

          case 7:
            text = GestureDetector(
              onTap: () {
                context.read<LineChartSampleViewModel>().filterMoodsData(MoodFilter.month);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 69.0),
                child: Text('1 Month', style: style),
              ),
            );
            break;

          default:
            text = const Text('');
            break;
        }
      }

      if (maxX == 30) {
        switch (value.toInt()) {
          case 1:
            text = GestureDetector(
              onTap: () {
                context.read<LineChartSampleViewModel>().filterMoodsData(MoodFilter.week);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 42.0),
                child: Text('1 Week', style: style),
              ),
            );
            break;

          case 28:
            text = GestureDetector(
              onTap: () {
                context.read<LineChartSampleViewModel>().filterMoodsData(MoodFilter.month);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text('1 Month', style: style),
              ),
            );
            break;

          default:
            text = const Text('');
            break;
        }
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 10,
        fitInside: const SideTitleFitInsideData(
          enabled: false,
          distanceFromEdge: 0,
          parentAxisSize: 6,
          axisPosition: 0,
        ),
        child: text ?? Text(""),
      );
    };
  }

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.lightBlue.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.lightBlue,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: true),
        spots: spots,
      );
}
