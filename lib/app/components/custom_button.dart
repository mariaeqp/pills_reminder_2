import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.backgroundColor = const Color(0xFF1BD15D),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 60,
      textColor: Colors.white,
      color: backgroundColor,
      onPressed: onTap,
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: 17,
          fontFamily: "medium",
        ),
      ),
    );
  }
}
