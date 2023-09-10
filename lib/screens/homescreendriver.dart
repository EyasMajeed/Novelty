import 'dart:async';

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';


class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  
  DatabaseReference fb = FirebaseDatabase.instance.ref().child("trips").child("1").child("driver");
  TextEditingController _numController = new TextEditingController(text: "0r");
  int data = 0;
  
 Widget isDriver() {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is signed in
      String userUid = user.uid;
      return Text('Current User UID: $userUid');
    } else {
      // User is signed out
      return Text('No user is signed in.');
    }
  }


  void initState() {
    super.initState();
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref('trips/1/students');
    starCountRef.once().then((myVal) {
      setState(() {
        
      data = myVal.snapshot.children.length;
      });
      _numController = new TextEditingController(text: data.toString());
      print("the data $data");
    });
      
    starCountRef.onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
      int numberOfChildren = event.snapshot.children.length;
      setState(() {
        
      data = numberOfChildren;
      });
      _numController = new TextEditingController(text: data.toString());
      print("recent data: $data");
    } 
});

    // Call the function to retrieve the number of students in trips
    // retrieveNumberOfStudentsInTrips();
  }

  // void retrieveNumberOfStudentsInTrips() {
  //     reference.child('trips').once().then((DataSnapshot snapshot) {
  //     print('Data : ${snapshot.value}');
  //   });
  // }
  // _databaseReference.child('trips').once().then((DataSnapshot snapshot) {
  //   // Access the trips data
  //   Map<dynamic, dynamic> tripsData = snapshot.value;

  //   // Initialize a variable to count students in trips
  //   int numberOfStudentsInTrips = 0;

  //   // Loop through the trips data
  //   tripsData.forEach((key, value) {
  //     if (value != null && value['students'] != null) {
  //       // Count the number of students in the trip
  //       numberOfStudentsInTrips += (value['students'] as Map).length - 1;
  //     }
  //   });

  //   // Print the number of students in trips
  //   print("Number of students in trips: $numberOfStudentsInTrips");
  // });

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    print("The user: ");
    // print(ref.val());
  //   ref.child("1").child("driver").once().then((DataSnapshot snapshot) {
  //     if (snapshot.value != null) {
  //       // Access and work with the data within the snapshot
  //       var data = snapshot.value;
  //       print('Data: $data');
  //     } else {
  //       print('No data found.');
  //     }
  //   } as FutureOr Function(DatabaseEvent value)).catchError((error) {
  //     print('Error fetching data: $error');
  //  });
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            'صفحة السائق',
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          )),
          leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icon(Icons.logout)),
        backgroundColor: Colors.amber.shade500,
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
                // FirebaseAnimatedList(
                //   key: UniqueKey(), // A unique key to identify the widget
                //   query: fb, // The reference to the data in Firebase RTDB
                //   itemBuilder: (BuildContext context, snapshot, Animation<double> animation, int index) {
                //     // Use the snapshot data to build the list item
                //     return ListTile(
                //       title: Text(snapshot.value.toString()),
                //       subtitle: Text(snapshot.toString()),
                //     );
                //   },
                // ),
                Text(
                  'show the number here',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  ': تعديل العدد ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Cairo',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12)),
                    width: 60.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      // child: TextField(
                      //   controller: _numController,
                      //   keyboardType: TextInputType.number,
                      //   inputFormatters: <TextInputFormatter>[
                      //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      //     FilteringTextInputFormatter.digitsOnly
                      //   ],
                      //   decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintStyle: TextStyle(
                      //         fontFamily: 'Cairo',
                      //       )),
                      // ),
                      child: Text(
                      data.toString(), // Text to display
                      style: TextStyle(
                        fontSize: 24, // Font size
                        fontWeight: FontWeight.bold, // Font weight
                        color: Colors.blue, // Text color
                      )
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ));
  }
}
