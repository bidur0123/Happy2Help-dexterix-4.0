import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:happy2help/Screens/ExpertPage/widget.dart/calenderWidget.dart';
import 'package:happy2help/Screens/ExpertPage/widget.dart/scheduledWidget.dart';

class ExpertPage extends StatefulWidget {
  const ExpertPage({super.key});

  @override
  State<ExpertPage> createState() => _ExpertPageState();
}

class _ExpertPageState extends State<ExpertPage> {
  int value = 0;
  List<Map<String, dynamic>> data = [
    {
      'date': '12',
      'day': 'Mon',
    },
    {
      'date': '13',
      'day': 'Tue',
    },
    {
      'date': '14',
      'day': 'Wed',
    },
    {
      'date': '14',
      'day': 'Thu',
    },
    {
      'date': '15',
      'day': 'Fri',
    },
    {
      'date': '16',
      'day': 'Sat',
    },
    {
      'date': '17',
      'day': 'Sun',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 70, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeInDown(
                  child: Text(
                    "Experts Team",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(height: 20),
          // FadeInLeft(
          //   delay: const Duration(milliseconds: 500),
          //   child: SizedBox(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height * 0.1,
          //       child: ListView.builder(
          //           itemCount: data.length,
          //           scrollDirection: Axis.horizontal,
          //           itemBuilder: (_, index) {
          //             return Padding(
          //               padding: EdgeInsets.only(
          //                   left: index == 0 ? 20.0 : 10,
          //                   right: index == data.length - 1 ? 20 : 0),
          //               child: GestureDetector(
          //                 onTap: () => setState(() {
          //                   value = index;
          //                 }),
          //                 child: CalenderWidget(
          //                     value: value, data: data, index: index),
          //               ),
          //             );
          //           })
          //   ),
          // ),
          // Scheduled Appointment Widget.
          ScheduledWidget(),
        ],
      ),
    );
  }
}
