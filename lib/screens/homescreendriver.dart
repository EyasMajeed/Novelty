import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'صفحة السائق',
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          )),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'عدد الركاب في الحافلة',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'show the number here',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        ' :تعديل العدد',
                        style: TextStyle(fontSize: 20, fontFamily: 'Cairo'),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
