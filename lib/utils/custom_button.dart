import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromRGBO(0, 0, 0, 0.08);
            }
            if (states.contains(MaterialState.hovered) || states.contains(MaterialState.focused)) {
              return const Color(0xFF16437E);
            }
            if (states.contains(MaterialState.pressed)) {
              return const Color(0xFF09223B);
            }
            return color ?? const Color(0xFF0A66C2);
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromRGBO(0, 0, 0, 0.3);
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}