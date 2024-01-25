import 'package:flutter/material.dart';

import '../resources/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Icon(
                  Icons.cloud,
                  color: AppColor.blueColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Text(
                    "CloudFinance",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "MENU",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          DrawerList(
            icon: Icons.widgets,
            title: "Overview",
            press: () {},
            tapColor: true,
          ),
          DrawerList(
            icon: Icons.equalizer_rounded,
            title: "Statistics",
            press: () {},
          ),
          DrawerList(
            icon: Icons.wallet,
            title: "Savings",
            press: () {},
          ),
          DrawerList(
            icon: Icons.pie_chart,
            title: "Portfolios",
            press: () {},
            widget: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black54,
            ),
          ),
          DrawerList(
            icon: Icons.message,
            title: "Messages",
            press: () {},
            widget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(12)),
              child: const Text(
                "13",
                style: TextStyle(fontSize: 8, color: Colors.white),
              ),
            ),
          ),
          DrawerList(
            icon: Icons.receipt,
            title: "Transactions",
            press: () {},
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "GENERAL",
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          DrawerList(
            icon: Icons.settings,
            title: "Settings",
            press: () {},
          ),
          DrawerList(
            icon: Icons.image,
            title: "Appearance",
            press: () {},
          ),
          DrawerList(
            icon: Icons.error,
            title: "Need Help",
            press: () {},
          ),
          const SizedBox(height: 20,),
          DrawerList(
            icon: Icons.logout,
            title: "Log Out",
            press: () {},
          ),
        ]
      ),
    );
  }
}

class DrawerList extends StatelessWidget {
  final String title;
  final Widget? widget;
  final IconData icon;
  final VoidCallback press;
  final bool tapColor;
  const DrawerList({
    Key? key,
    required this.title,
    required this.icon,
    this.tapColor = false,
    required this.press,
    this.widget,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
              color: tapColor ? AppColor.blueColor : AppColor.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: ListTile(
            onTap: press,
            horizontalTitleGap: 0.0,
            trailing: widget,
            leading: Icon(
              icon,
              color: tapColor ? Colors.white54 : Colors.grey,
            ),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
