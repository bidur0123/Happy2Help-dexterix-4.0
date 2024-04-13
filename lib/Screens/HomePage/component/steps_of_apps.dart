import 'package:flutter/material.dart';

class AppSteps extends StatelessWidget {
  final String iconImagePath;
  final String text;

  const AppSteps({
    Key? key,
    required this.iconImagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(10),
        color: Colors.indigo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconImagePath,
              height: 40,
              width: 40,

            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
