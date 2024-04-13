import 'package:flutter/material.dart';

class DoctorAppointmentList extends StatelessWidget {
  const DoctorAppointmentList({super.key});
  static const List<Color> appointmentlistColor = [
  Color.fromARGB(255, 151, 158, 230),
  Color.fromARGB(255, 245, 185, 185),
  Color.fromARGB(255, 165, 228, 212),
  Color.fromARGB(255, 167, 207, 245)
];

  Widget _doctorList(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: [
          ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: appointmentlistColor[index % 4],
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/admin/userr.png"),
            ),
            title: const Text("Patient's Name"),
            subtitle: Text(
                "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"),
            trailing: IconButton(
              onPressed: () {},
              icon: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Icon(Icons.arrow_forward_ios)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _doctorList(context, index);
        });
  }
}
