import 'package:flutter/material.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  int index = 0;
  final pages = [
    Center(
      child: Text('Here Will be the gps'),
    ),
    Center(
      child: Text('Here Will be the video'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'صفحة قائد المدرسة',
          style: TextStyle(fontFamily: 'Cairo'),
        ),
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.gps_fixed),
            selectedIcon: Icon(Icons.gps_fixed_outlined),
            label: 'موقع الباص',
          ),
          NavigationDestination(
            icon: Icon(Icons.camera_alt_outlined),
            selectedIcon: Icon(Icons.camera_alt),
            label: 'كاميرا الحافلة',
          ),
        ],
      ),
    );
  }
}
