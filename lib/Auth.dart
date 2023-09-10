import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:novelty_app/screens/homescreen.dart';
import 'package:novelty_app/screens/homescreendriver.dart';
import 'package:novelty_app/screens/loginscreen.dart';

// class Auth extends StatelessWidget {
//   const Auth({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<User?>(
//         future: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           String page = 'login';
//           if (snapshot.hasData) {
//             String uid = snapshot.data!.uid;
//             // get user role
//             DatabaseReference user = FirebaseDatabase.instance.ref('users/$uid');
//             user.once().then((val) {
//               if(val.snapshot.value != null){

//               Map<String, dynamic> data = val.snapshot.value as Map<String, dynamic>;
//               String role = data['role'];
//               if(role == 'parent'){
//               print("The value: $role");
//               page = role;
//               print("The page: $page");
//                 return HomeScreen();
//               }else if(role == 'driver'){
//                 page = role;
//                 print("The page: $page");
//                 return DriverScreen();
//               }
//               else if (role == 'supervisor'){
//                 page = role;
//                 return HomeScreen();
//               }else{
//                 page = 'login';
//                 print("The page: $page");
//                 return LoginScreen();
//               }
//             }
//           });
//           }
//               return LoginScreen();
//         }
//           // print(page);
//       ),
//     );
//   }
// }


class Auth extends StatelessWidget {
  const Auth({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<User?>(
        future: FirebaseAuth.instance.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Display a loading indicator while waiting for authentication state.
          }
          if (snapshot.hasData) {
            String uid = snapshot.data!.uid;
            return FutureBuilder<DataSnapshot>(
              future: FirebaseDatabase.instance.ref('users/$uid').once().then((value) => value.snapshot),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); // Display a loading indicator while waiting for user data.
                }
                if (dataSnapshot.hasData) {
                  Map<String, dynamic> data = dataSnapshot.data!.value as Map<String, dynamic>;
                  String role = data['role'];
                  if (role == 'parent') {
                    return HomeScreen();
                  } else if (role == 'driver') {
                    return DriverScreen();
                  } else if (role == 'supervisor') {
                    return HomeScreen();
                  } else {
                    return LoginScreen();
                  }
                } else {
                  return LoginScreen();
                }
              },
            );
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}

