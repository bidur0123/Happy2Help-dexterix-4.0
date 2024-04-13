import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:happy2help/Screens/ChatBot/chat_bot.dart';
import 'package:happy2help/Screens/ExpertPage/expert_page.dart';
import 'package:happy2help/Screens/HomePage/component/banner.dart';
import 'package:happy2help/Screens/HomePage/component/steps_of_apps.dart';
import 'package:happy2help/Screens/HomePage/component/upcoming.dart';
import 'package:happy2help/Screens/NotificationScreen/notifi.dart';
import 'package:happy2help/Screens/SurveyPage/component/survey_start.dart';
import 'package:happy2help/utils/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: const Text(
          'Hi Kushaan👋',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          const Row(
            children: [
              Icon(
                  Icons.monetization_on,
                color: Colors.yellowAccent,
              ),
              SizedBox(width: 5),
              Text(
                '15',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
            icon: const Icon(Icons.notifications_active_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatBotApp()));
        },
        child: const Icon(
          Icons.chat,
        ),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              //    const TopUserNameWithNotification(),
              Container(
                alignment: AlignmentDirectional.topStart,
                padding: const EdgeInsets.only(left: 30),
                child: const Center(
                  child: Text(
                    'Mental Health Matter',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const BannerContainer(
                imagePath: 'assets/images/Banner.png',
                height: 200,
                width: double.infinity,
              ),
              const Text(
                'Seek help!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: CustomButton(
                  text: 'Take the Survey',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SurveyStartPage()));
                  },
                  color: Colors.green,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 10),
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      AppSteps(
                          iconImagePath: "assets/images/pers_match.png",
                          text: "Take \nAssesment"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.forward),
                      AppSteps(
                          iconImagePath: "assets/images/jigsaw.png",
                          text: "Personalised \nMatching"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.forward),
                      AppSteps(
                          iconImagePath: "assets/images/shield.png",
                          text: "Secure \nSessions"),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const UpcomingAppointments(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
