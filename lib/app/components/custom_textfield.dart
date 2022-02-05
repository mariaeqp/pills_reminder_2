import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? icon;
  final Color backgroundColor;
  final String? title;
  final bool isObscure;
  final String? hintText;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    this.title,
    this.hintText,
    required this.controller,
    this.icon,
    this.isObscure = false,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          alignment: Alignment.centerLeft,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor,
          ),
          child: Row(
            children: [
              if (icon != null)
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Image.asset(
                    "images/$icon.png",
                    height: 30,
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    isCollapsed: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
