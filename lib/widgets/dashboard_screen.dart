import 'package:finance_management_web/model/overview_data.dart';
import 'package:finance_management_web/resources/colors.dart';
import 'package:finance_management_web/widgets/bar_chart.dart';
import 'package:finance_management_web/widgets/total_savings.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
import 'header.dart';
import 'latest_transaction.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return  SafeArea(
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Overview"),
                        const SizedBox(
                          height: 16,
                        ),
                        Responsive(
                          mobile: GridInfoCard(crossAxisCount: _size.width< 650 ? 2: 4,
                            childAspectRatio:_size.width <650 ? 2.50 : 1.80,),
                          desktop: const GridInfoCard(),
                          tablet: const GridInfoCard(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 3,
                              child: BarChartScreen(),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            if(!Responsive.isMobile(context))
                            const Expanded(flex: 2, child: TotalSavings())
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const LatestTransaction(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class GridInfoCard extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  const GridInfoCard({
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.80,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: overviewDataDetails.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) {
        return OverViewInfoCard(
          infoData: overviewDataDetails[index],
        );
      },
    );
  }
}

class OverViewInfoCard extends StatelessWidget {
  final OverviewData infoData;
  const OverViewInfoCard({
    super.key,
    required this.infoData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppColor.whiteCard,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(infoData.icon),
              const SizedBox(
                width: 10,
              ),
              Text(infoData.title),
            ],
          ),
          Row(
            children: [
              Text(
                infoData.amount,
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                    color: infoData.color,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(30))),
                child:  Row(
                  children: [
                    Icon(
                      infoData.arrow,
                      size: 15,
                      color: infoData.textColor,
                    ),
                    Text(
                      infoData.percentChange,
                      style: TextStyle(
                          color: infoData.textColor,
                          fontSize: 8,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: infoData.amountChange,
                  style: const TextStyle(
                    color: AppColor.greenColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(
                  text: ' than last month',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
