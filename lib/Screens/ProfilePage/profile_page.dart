import 'package:flutter/material.dart';
import 'package:happy2help/Screens/Auth_Screen/Login/login_screen.dart';
import 'package:happy2help/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20 , right: 20),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/icons/userr.png',
              ),
            ),
            const SizedBox(height: 20),
             Text(
              user.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
             Text(
              user.email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text(
            //       'Language Preference:',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //     DropdownButton<String>(
            //       value: 'English',
            //       onChanged: (String? newValue) {
            //
            //       },
            //       items: <String>['English', 'Hindi']
            //           .map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //     ),
            //   ],
            // ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
              },
              child: const Text('Log Out'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


