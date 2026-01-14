import 'package:flutter/widgets.dart';

enum Gender { male, female }

class Gender_Secation_Widget extends StatelessWidget {
  Gender_Secation_Widget({
    super.key,
    required this.imagepath,
    required this.gender,
    required this.ismale,
    this.onTap,
  });

  String imagepath;
  String gender;
  void Function()? onTap;
  bool ismale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 17, left: 30, right: 30),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ismale ? Color(0xff24263B) : Color(0xff333244),
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(imagepath),
            Text(
              gender,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff8B8C9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
