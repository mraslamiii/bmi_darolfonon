import 'package:bmi/pages/bmi_cal.dart';
import 'package:bmi/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      home: const BmiCalPage(),
    );
  }
}
