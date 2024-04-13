import 'package:flutter/material.dart';
import 'package:happy2help/Screens/BaseScreen/base_screen.dart';
import 'package:happy2help/utils/custom_button.dart';

class AppointmentWidget extends StatelessWidget {
  final bool isBooked;

  const AppointmentWidget({
    Key? key,
    required this.isBooked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 200),
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: isBooked ? Colors.green : Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isBooked ? 'Booked' : 'Available',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 33
                      ),
                    ),
                    const SizedBox(width: 10,),
                    const Icon(
                        Icons.check_circle,
                      color: Colors.white,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 90 , right: 90 , top: 30),
            child: CustomButton(
                text: "Done",
                onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const BaseScreen()), (route) => false);
                }
            ),
          )
        ],
      ),
    );
  }
}

class DoctorAppointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Doctor Appointments'),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppointmentWidget(isBooked: true), // Booked appointment
            AppointmentWidget(isBooked: false), // Available appointment
            AppointmentWidget(isBooked: false), // Available appointment
          ],
        ),
      ),
    );
  }
}

