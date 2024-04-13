import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy2help/Screens/Doctor-panel/screens/appointmentlist.dart';

class AppointMentAlertMain extends StatelessWidget {
  const AppointMentAlertMain({super.key});

  Widget _header() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TyperAnimatedTextKit(
              text: ["Welcome Back,"],
              textStyle: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: Duration(milliseconds: 100),
              pause: Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            TyperAnimatedTextKit(
              text: ['Dr. Atif'],
              textStyle: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 100),
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/admin/userr.png"),
          ),
        )
      ],
    );
  }

  Widget _balance(BuildContext context, bool isPortrait) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: (isPortrait)
            ? MediaQuery.of(context).size.height * 0.2
            : MediaQuery.of(context).size.width * 0.3,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 239, 131, 121)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: (isPortrait)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Balance",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: (isPortrait)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(
                          "assets/admin/coin_image.png",
                        ),
                      ),
                      Text(
                        " 4800000.00",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              right: 2,
              bottom: 0,
              child: Image(
                image: AssetImage(
                  "assets/admin/balance_card.png",
                ),
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _checkAppointment() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: CustomBuutton(
  //         text: "Check Appointment",
  //         onPressed: () {},
  //         buttonColor: Colors.red.shade300,
  //         textColor: Colors.black),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            _header(),
            const SizedBox(
              height: 16,
            ),
            _balance(context, isPortrait),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Your Appointments",
              style: GoogleFonts.poppins(
                  fontSize: 26, fontWeight: FontWeight.w400),
            ),
            const DoctorAppointmentList()
          ],
        ),
      ),
    );
  }
}
