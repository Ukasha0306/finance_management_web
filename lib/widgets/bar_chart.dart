import 'package:finance_management_web/resources/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartScreen extends StatefulWidget {
  const BarChartScreen({Key? key}) : super(key: key);

  @override
  State<BarChartScreen> createState() => _BarChartScreenState();
}





class _BarChartScreenState extends State<BarChartScreen> {
  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final barGroup1 = makeGroupData(0, 12, 6);
    final barGroup2 = makeGroupData(1, 16, 10);
    final barGroup3 = makeGroupData(2, 8, 4);
    final barGroup4 = makeGroupData(3, 16, 14);
    final barGroup5 = makeGroupData(4, 19, 8);
    final barGroup6 = makeGroupData(4, 17, 9);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColor.whiteCard,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Statistics"),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Earnings"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Spendings"),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Text("Yearly"),
                      Icon(Icons.arrow_drop_down_outlined),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.grey,
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 35,
                          interval: 1,
                          getTitlesWidget: leftTitles),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true, getTitlesWidget: getBottomTile),
                    ),
                  ),
                  barGroups: showingBarGroups,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget getBottomTile(double value, TitleMeta meta) {
  const style = TextStyle(fontSize: 14, color: Colors.grey);
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text(
        "Jan",
        style: style,
      );
      break;
    case 1:
      text = const Text(
        "Feb",
        style: style,
      );
      break;
    case 2:
      text = const Text(
        "Mar",
        style: style,
      );
      break;
    case 3:
      text = const Text(
        "Apr",
        style: style,
      );
      break;
    case 4:
      text = const Text(
        "May",
        style: style,
      );
      break;
    case 5:
      text = const Text(
        "Jun",
        style: style,
      );
      break;

    default:
      text = const Text(
        "",
        style: style,
      );
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 4) {
    text = '\$200';
  } else if (value == 8) {
    text = '\$400';
  } else if (value == 12) {
    text = '\$600';
  } else if (value == 16) {
    text = '\$800';
  } else if (value == 20) {
    text = '\$1000';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  return BarChartGroupData(
    barsSpace: 8,
    x: x,
    barRods: [
      BarChartRodData(
        toY: y1,
        color: AppColor.blueColor,
        width: 30,
      ),
      BarChartRodData(
        toY: y2,
        color: Colors.grey,
        width: 30,
      ),
    ],
  );
}
