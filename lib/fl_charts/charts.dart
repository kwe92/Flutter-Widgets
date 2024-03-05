import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widgets/fl_charts/line_chart_example_view_model.dart';
import 'package:provider/provider.dart';

class LineChartExample extends StatelessWidget {
  final List<FlSpot> spots;
  const LineChartExample({
    required this.spots,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1(context.watch<LineChartSampleViewModel>().maxX),
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData sampleData1(double maxX) => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: maxX,
        maxY: 4,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
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
  Widget Function(double, TitleMeta) bottomTitleWidgetsWrapper(DateTime date) {
    return (double value, TitleMeta meta) {
      const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
      Widget text;
      switch (value.toInt()) {
        case 1:
          text = Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  context.read<LineChartSampleViewModel>().filterMoodsData(MoodFilter.week);
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 24.0),
                  child: Text('Week', style: style),
                ),
              );
            },
          );
          break;

        case 15:
          text = GestureDetector(
            onTap: () {},
            child: const Text(
              'Month',
              style: style,
            ),
          );
          break;

        case 28:
          text = GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 24.0),
              child: Text('Year', style: style),
            ),
          );
          break;

        default:
          text = const Text('');
          break;
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
        child: text,
      );
    };
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        // getTitlesWidget: bottomTitleWidgets,
        getTitlesWidget: bottomTitleWidgetsWrapper(DateTime.now()),
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: AppColors.primary.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: false,
        color: Colors.lightBlue,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: spots,
      );
}

class AppColors {
  static const Color primary = Colors.lightBlue;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
