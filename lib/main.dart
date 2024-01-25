import 'package:finance_management_web/resources/colors.dart';
import 'package:finance_management_web/view/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloud Finance UI',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColor.backgroundGrey,
        textTheme:Theme.of(context).textTheme.apply(bodyColor: Colors.black)
      ),
      home: const MainScreen(),
    );
  }
}


