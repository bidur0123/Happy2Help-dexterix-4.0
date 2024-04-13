import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy2help/Screens/ExpertPage/widget.dart/customPainter.dart';
import 'package:happy2help/Screens/ExpertPage/widget.dart/data.dart';
import 'package:happy2help/Screens/ExpertPage/widget.dart/doctor_profile/doctor_profile.dart';

class ScheduledWidget extends StatelessWidget {
  ScheduledWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: scheduleData.length,
        itemBuilder: (_, index) {
          var item = scheduleData[index];
          return FadeInUp(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DoctorProfile()));
              },
              child: Column(
                children: [
                  CustomPaint(
                    size: const Size(250, 0),
                    painter: DottedLinePainter(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 10),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: item['color'],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(item['dr-Img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0),
                                    child: Text(
                                      item['dr-Name'],
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    item['typeofDoctor'],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: index == 0
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.chat,
                                        color:Colors.white
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          "Connect",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const Spacer(),
                              // Icon(
                              //   Icons.more_horiz,
                              //   color:
                              //   index == 0 ? Colors.white : Colors.black,
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
