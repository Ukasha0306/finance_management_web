import 'package:finance_management_web/widgets/side_menu.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';
import '../widgets/dashboard_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
            const Expanded(flex: 1, child: SideMenu()),
            const Expanded(flex: 5, child: DashBoardScreen())
          ],
        ),
      ),
    );
  }
}
