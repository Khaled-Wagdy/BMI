import 'package:flutter/material.dart';

class InfoUserWidget extends StatelessWidget {
  InfoUserWidget({
    super.key,
    required this.title,
    required this.value,
    this.onPressedAdd,
    this.onPressedRemove,
  });
  String title;
  int value;
  void Function()? onPressedAdd;
  void Function()? onPressedRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff24263B),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: Color(0xff8B8C9E),
            ),
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xffFFFFFF),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: onPressedRemove,
                backgroundColor: Color(0xff8B8C9E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset('assets/icones/remove_icone.png'),
              ),
              FloatingActionButton(
                onPressed: onPressedAdd,
                backgroundColor: Color(0xff8B8C9E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image.asset('assets/icones/add_icone.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
