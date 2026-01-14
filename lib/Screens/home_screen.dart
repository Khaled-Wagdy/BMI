// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bmi/Widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import '../Widgets/gender_secation_widget.dart';
import '../Widgets/info_user_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double value = 150;
  bool ismale = true;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    log('reBuild Ui');
    return Scaffold(
      backgroundColor: Color(0xff1C2135),
      appBar: AppBarWidget(title: 'BMI Calculator'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Gender_Secation_Widget(
                      imagepath: 'assets/icones/icone_male.png',
                      gender: 'male',
                      ismale: ismale,
                      onTap: () {
                        ismale = true;
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: Gender_Secation_Widget(
                      imagepath: 'assets/icones/icone_female.png',
                      gender: 'female',
                      ismale: !ismale,
                      onTap: () {
                        ismale = false;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xff333244),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Hight',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff8B8C9E),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: value,
                      min: 50,
                      max: 200,
                      activeColor: Color(0xffE83D67),
                      inactiveColor: Color(0xffFFFFFF),
                      onChanged: (newValue) {
                        setState(() {
                          value = newValue;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: InfoUserWidget(
                      title: 'weight',
                      value: weight,
                      onPressedAdd: () {
                        if (weight > 20 && weight <= 200) {
                          weight++;
                          setState(() {});
                        }
                      },
                      onPressedRemove: () {
                        if (weight > 20 && weight <= 200) {
                          weight--;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: InfoUserWidget(
                      title: 'age',
                      value: age,
                      onPressedAdd: () {
                        if (age > 0 && age <= 100) {
                          age++;
                          setState(() {});
                        }
                      },
                      onPressedRemove: () {
                        if (age > 0 && age <= 100) {
                          age--;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            'ResultScreen',
            arguments: BMIData(
              Gender: ismale,
              height: value.round().toInt(),
              weight: weight,
              age: age,
            ),
          );
        },
        color: Color(0xffE83D67),
        height: 100,
        child: Text(
          'Calculate',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xffFFFFFF),
          ),
        ),
      ),
    );
  }
}

class BMIData {
  bool Gender;
  int height;
  int weight;
  int age;

  BMIData({
    required this.Gender,
    required this.height,
    required this.weight,
    required this.age,
  });
}
