
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color mainColor = Colors.deepPurple;

class EnneagramChart extends StatefulWidget {
  final String title;
  final Map<int,double> scoreMap;
  final double maxScore;
  const EnneagramChart({super.key, required this.scoreMap, required this.maxScore, required this.title});

  List<Color> get availableColors => const <Color>[
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => EnneagramChartState();
}

class EnneagramChartState extends State<EnneagramChart> {
  final Color barBackgroundColor = Colors.deepPurple.shade500; //const Color(0xff72d8bf);
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.deepPurple.shade300, //const Color(0xff81e5cd),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,// mainColor,//const Color(0xff0f4a3c),
                      fontSize: Get.textTheme.headline5!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: BarChart(
                        mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.white,
        double width = 26,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y : y ,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow.shade600)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: widget.maxScore,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(9, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, widget.scoreMap[1]!, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, widget.scoreMap[2]!, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, widget.scoreMap[3]!, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, widget.scoreMap[4]!, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, widget.scoreMap[5]!, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, widget.scoreMap[6]!, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, widget.scoreMap[7]!, isTouched: i == touchedIndex);
      case 7:
        return makeGroupData(7, widget.scoreMap[8]!, isTouched: i == touchedIndex);
      case 8:
        return makeGroupData(8, widget.scoreMap[9]!, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.deepPurple.shade900,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = '1유형(소)';
                break;
              case 1:
                weekDay = '2유형(강아지)';
                break;
              case 2:
                weekDay = '3유형(독수리)';
                break;
              case 3:
                weekDay = '4유형(고양이)';
                break;
              case 4:
                weekDay = '5유형(부엉이)';
                break;
              case 5:
                weekDay = '6유형(사슴)';
                break;
              case 6:
                weekDay = '7유형(원숭이)';
                break;
              case 7:
                weekDay = '8유형(호랑이)';
                break;
              case 8:
                weekDay = '9유형(코끼리)';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY).toString(),
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('1유형', style: style);
        break;
      case 1:
        text = const Text('2유형', style: style);
        break;
      case 2:
        text = const Text('3유형', style: style);
        break;
      case 3:
        text = const Text('4유형', style: style);
        break;
      case 4:
        text = const Text('5유형', style: style);
        break;
      case 5:
        text = const Text('6유형', style: style);
        break;
      case 6:
        text = const Text('7유형', style: style);
        break;
      case 7:
        text = const Text('8유형', style: style);
        break;
      case 8:
        text = const Text('9유형', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}