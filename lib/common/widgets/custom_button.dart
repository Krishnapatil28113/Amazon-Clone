import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, required this.onTap, this.color});
  final String text;
  final Color? color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize:
            Size(double.infinity, MediaQuery.of(context).size.height * 0.06),
        primary: color,
      ),
    );
  }
}
