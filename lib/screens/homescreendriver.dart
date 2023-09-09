import 'package:flutter/material.dart';

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  
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

  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  void initState() {
    super.initState();

    // Call the function to retrieve the number of students in trips
    retrieveNumberOfStudentsInTrips();
  }

  void retrieveNumberOfStudentsInTrips() {
  _databaseReference.child('trips').once().then((snapshot) {
    // Access the trips data
    Map<dynamic, dynamic> tripsData = snapshot.value;

    // Initialize a variable to count students in trips
    int numberOfStudentsInTrips = 0;

    // Loop through the trips data
    tripsData.forEach((key, value) {
      if (value != null && value['students'] != null) {
        // Count the number of students in the trip
        numberOfStudentsInTrips += (value['students'] as Map).length - 1;
      }
    });

    // Print the number of students in trips
    print("Number of students in trips: $numberOfStudentsInTrips");
  });
}
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
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                            )),
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
