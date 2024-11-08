import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final buttonColor;
  final textColor;
  final String buttonText;
  final buttonTap;
  const Buttons(
      {super.key,
      this.buttonColor,
      this.textColor,
      required this.buttonText,
      this.buttonTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
