import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy2help/Screens/ChatPage/chat_page.dart';
import 'package:happy2help/Screens/ExpertPage/widget.dart/appointment_success.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorProfile extends StatefulWidget {
  final String? doctor;

  const DoctorProfile({
    Key? key,
    this.doctor
  }) : super(key: key);
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  _launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  bool isBooked = true;
  bool isBookingInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(
                      icon: const Icon(
                        Icons.chevron_left_sharp,
                        color: Colors.indigo,
                        size: 30,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/d2.jpeg"),
                    // backgroundImage: NetworkImage(document['image']),
                    // backgroundColor: Colors.lightBlue[100],
                    radius: 80,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    // document['name'],
                    "Dr Atif",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    // document['type'],
                    "Psychatrist",
                    style: GoogleFonts.lato(
                      //fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     for (var i = 0; i < document['rating']; i++)
                  //       const Icon(
                  //         Icons.star_rounded,
                  //         color: Colors.indigoAccent,
                  //         size: 30,
                  //       ),
                  //     if (5 - document['rating'] > 0)
                  //       for (var i = 0; i < 5 - document['rating']; i++)
                  //         const Icon(
                  //           Icons.star_rounded,
                  //           color: Colors.black12,
                  //           size: 30,
                  //         ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 14,
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 22, right: 22),
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     document['specification'],
                  //     textAlign: TextAlign.center,
                  //     style: GoogleFonts.lato(
                  //       fontSize: 14,
                  //       color: Colors.black54,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.place_outlined),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: Text(
                            "New Delhi , India ",
                            //  document['address'],
                            style: GoogleFonts.lato(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 12,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 11,
                        ),
                        TextButton(
                          onPressed: () {
                            //   _launchCaller("tel:" + document['phone'])
                          },
                          child: Text(
                            //  document['phone'].toString(),
                            "7398682731",
                            style: GoogleFonts.lato(
                                fontSize: 16, color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(Icons.access_time_rounded),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Working Hours',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        Text(
                          'Today: ',
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          // document['openHour'] +
                          //     " - " +
                          //     document['closeHour'],
                          "10:00 AM- 1:00 PM",
                          style: GoogleFonts.lato(
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.indigo.withOpacity(0.9), elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Chat with Doctor',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  const Text("or"),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.indigo.withOpacity(0.9), elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isBookingInProgress = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            isBookingInProgress = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AppointmentWidget(
                                    isBooked: isBooked
                                )
                            ),
                          );
                        });
                      },
                      child: isBookingInProgress
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        'Book an Appointment',
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
