
import 'package:flutter/material.dart';

import '../resources/colors.dart';

class OverviewData {
  final String title;
  final IconData icon;
  final IconData arrow;
  final String amount;
  final String percentChange;
  final String amountChange;
  final Color color;
  final Color textColor;

  OverviewData({
    required this.title,
    required this.icon,
    required this.arrow,
    required this.amount,
    required this.percentChange,
    required this.amountChange,
    required this.color,
    required this.textColor,
  });
}

List overviewDataDetails = [
  OverviewData(
    icon: Icons.money,
    arrow: Icons.arrow_upward,
    title: "Earning",
    amount: "\$928.41",
    color: AppColor.backGroundGreen,
    percentChange: "12.8%",
    amountChange: "\$118.8",
    textColor: AppColor.greenColor,
  ),
  OverviewData(
    icon: Icons.shopping_cart,
    arrow: Icons.arrow_downward,
    title: "Spending",
    amount: "\$169.43",
    color: AppColor.redColor,
    percentChange: "3.1%",
    amountChange: "\$5.2",
    textColor: AppColor.whiteCard,
  ),
  OverviewData(
    icon: Icons.save,
    arrow: Icons.arrow_upward,
    title: "Saving",
    amount: "\$406.27",
    color: AppColor.backGroundGreen,
    percentChange: "8.2%",
    amountChange: "\$33.3",
    textColor: AppColor.greenColor,
  ),
  OverviewData(
    icon: Icons.score,
    arrow: Icons.arrow_upward,
    title: "Investment",
    amount: "\$1854.08",
    color: AppColor.backGroundGreen,
    percentChange: "9.2%",
    amountChange: "\$78.5",
    textColor: AppColor.greenColor,
  ),
];
