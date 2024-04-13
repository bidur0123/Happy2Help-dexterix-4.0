import 'package:flutter/material.dart';
import 'package:happy2help/Screens/BaseScreen/base_screen.dart';
import 'package:happy2help/utils/custom_button.dart';
import 'package:lottie/lottie.dart';

class ResultScreen extends StatefulWidget {
  final int totalScore;
  const ResultScreen(this.totalScore,{Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Survey Result'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReportSubmittedContainer(),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.only(left: 120 , right: 90 ,top: 20),
            child: CustomButton(
                text: "Okay",
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


class ReportSubmittedContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 130,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Your report has been Generated. You can now connect with our doctor.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


