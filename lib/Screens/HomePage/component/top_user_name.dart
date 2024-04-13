import 'package:flutter/material.dart';

class TopUserNameWithNotification extends StatefulWidget {
  const TopUserNameWithNotification({Key? key});

  @override
  State<TopUserNameWithNotification> createState() =>
      _TopUserNameWithNotificationState();
}

class _TopUserNameWithNotificationState
    extends State<TopUserNameWithNotification> {
  bool hasNotification = false; // Assuming notification state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30 , right: 30 , top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Hi Kushaan👋',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),

          Icon(
            hasNotification ? Icons.notifications : Icons.notifications_none,
            color: hasNotification ? Colors.red : Colors.grey,
          ),
        ],
      ),
    );
  }
}
