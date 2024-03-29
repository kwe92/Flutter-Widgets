import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/fl_charts/chartsv2.dart';
import 'package:flutter_widgets/fl_charts/line_chart_example_view_model.dart';
import 'package:provider/provider.dart';

class LineChartSampleView extends StatelessWidget {
  const LineChartSampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LineChartSampleViewModel(),
      builder: (context, _) {
        final model = context.watch<LineChartSampleViewModel>();
        return AspectRatio(
          aspectRatio: 1.23,
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 16, top: 32, right: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: const Offset(0, 2),
                        spreadRadius: 1,
                        blurRadius: 3,
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      model.isMonthlyView ? 'Monthly Mood Statistics' : 'Weekly Mood Statistics',
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 6),
                        child: LineChartExampleV2(
                          spots: [
                            for (int i = 0; i < model.groupedMoodsData.length; i++)
                              () {
                                print("model.groupedMoodsData.length: ${model.groupedMoodsData.length}");
                                final entry = model.groupedMoodsData[i].entries.toList()[0];

                                debugPrint("entry: $entry");

                                return FlSpot(i + 1.0, entry.value * 4);
                              }()
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
