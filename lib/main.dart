import 'package:bmi/Screens/Result.dart';
import 'package:bmi/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

  
      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen': (context) => HomeScreen(),
        'ResultScreen': (context) => ResultScreen(),
      },
    );
  }
}
