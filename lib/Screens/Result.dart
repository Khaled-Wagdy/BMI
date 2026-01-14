import 'dart:math';

import 'package:bmi/Screens/home_screen.dart';
import 'package:bmi/Widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bmiData = ModalRoute.of(context)?.settings.arguments as BMIData;

    double calculateBMI = bmiData.weight / pow(bmiData.height / 100, 2);

    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBarWidget(title: 'BMI Calculator'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 25),
          Text(
            'Your Result',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF),
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: BoxDecoration(
                color: Color(0xff333244),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiState(calculateBMI),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff21BF73),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    calculateBMI.round().toString(),
                    style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                  SizedBox(height: 60),
                  Text(
                    'You Have Normal Body Weight, Good Job',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8B8C9E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        color: Color(0xffE83D67),
        height: 100,
        child: Text(
          'Re - Calculate',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }

  String bmiState(double calculateBMI) {
    if (calculateBMI < 18.5) {
      return "Under weight";
    } else if (calculateBMI < 25) {
      return "Normal weight";
    } else if (calculateBMI < 30) {
      return "Overweight";
    } else if (calculateBMI < 35) {
      return "Obesity Class I";
    } else if (calculateBMI < 40) {
      return "Obesity Class II";
    } else {
      return "Extreme Obesity ( Class III)";
    }
  }
}
