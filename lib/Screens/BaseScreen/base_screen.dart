import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy2help/Screens/Community/community.dart';
import 'package:happy2help/Screens/ExpertPage/expert_page.dart';
import 'package:happy2help/Screens/HomePage/homepage.dart';
import 'package:happy2help/Screens/ProfilePage/profile_page.dart';
import 'package:happy2help/Screens/self_help/self_help.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      const HomePage(),
      const ExpertPage(),
       SelfHelp(),
       Community(),
       ProfilePage(),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        showElevation: true,
        items: [
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.house),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.userDoctor),
            title: const Text('Expert'),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.hireAHelper),
            title: const Text('SelfHelp'),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.peopleGroup),
            title: const Text('Groups'),
          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.user),
            title: const Text('Profile'),
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
