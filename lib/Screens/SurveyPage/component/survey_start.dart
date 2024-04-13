import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:happy2help/Screens/SurveyPage/survey_page.dart';
import 'package:happy2help/utils/custom_button.dart';

// class SurveyStartPage extends StatelessWidget {
//   const SurveyStartPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.only(left: 40 , right: 40),
//           child: CustomButton(
//             text: 'Start Survey',
//             onTap: (){
//
//             },
//           ),
//         ),
//       )
//     );
//   }
// }

class SurveyStartPage extends StatefulWidget {
  const SurveyStartPage({super.key});

  @override
  State<SurveyStartPage> createState() => _SurveyStartPageState();
}

class _SurveyStartPageState extends State<SurveyStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue.shade900 ,
        elevation: 0,
      ),
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children:  [
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: AnimatedTextKit (
                    animatedTexts: [
                      TyperAnimatedText('Survey',
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                    //   repeatForever: true,
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                height: 250.0,
                width: 250.0,
                decoration: BoxDecoration(
                  image:const DecorationImage(
                    image: AssetImage("assets/images/need_assessment22.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
              ),

              const  SizedBox(height: 40.0),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText(
                      "Let's Start Survey",
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold
                      )),
                ],
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                width: 120.0,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.orange, // Set the background color to orange
                  ),
                  child: const Text(
                    'START',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

