import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../resources/colors.dart';

class TotalSavings extends StatefulWidget {
  const TotalSavings({Key? key}) : super(key: key);

  @override
  State<TotalSavings> createState() => _TotalSavingsState();
}

class _TotalSavingsState extends State<TotalSavings> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1.5,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: AppColor.whiteCard,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Savings",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Icon(Icons.more_horiz)
              ],
            ),
            Row(
              children: [
                const Text(
                  "\$406.27",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_upward_outlined,
                        size: 15,
                        color: Colors.green,
                      ),
                      Text(
                        "8.2%",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 8,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                      text: "+\$33.3 ",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.green)),
                  TextSpan(
                      text: "than last month",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const Divider(),
            const ProgressBar(
              name: "Dream Studio",
              percentage: 0.5,
              title: "\$251.9",
              subTitle: "/\$750",
            ),
            const ProgressBar(
              name: "Education",
              percentage: 0.8,
              title: "\$221.9",
              subTitle: "/\$200",
            ),
            const ProgressBar(
              name: "Health Care",
              percentage: 0.2,
              title: "\$30.8",
              subTitle: "/\$150",
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final String name;
  final String title;
  final String subTitle;
  final double percentage;
  const ProgressBar({
    super.key,
    required this.title,
    required this.percentage,
    required this.subTitle,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: subTitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        LinearPercentIndicator(
          lineHeight: 10,
          percent: percentage,
          padding: EdgeInsets.zero,
          animation: true,
          animationDuration: 500,
          progressColor: AppColor.blueColor,
          backgroundColor: Colors.grey.withOpacity(0.3),
          barRadius: const Radius.circular(50),
        )
      ],
    );
  }
}
