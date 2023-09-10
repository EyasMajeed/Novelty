import 'package:flutter/material.dart';
import 'package:novelty_app/screens/homescreen.dart';
import 'package:novelty_app/screens/loginscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:novelty_app/screens/signupscreen.dart';
import 'package:novelty_app/user_provider.dart';
import 'Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBd9pNYGl2YAB3x4OgBBFZBLiZtCKUmvMo",
      appId: "novelty-app-de786",
      messagingSenderId: "XXX",
      projectId: "novelty-app-de786",
      databaseURL: "https://novelty-app-de786-default-rtdb.asia-southeast1.firebasedatabase.app",
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber), // Theme data
      // home: const Auth(),
      routes: {
        '/': (context) => const Auth(),
        'homeScreen': (context) => const HomeScreen(),
        'signupScreen': (context) => const SignupScreen(),
        'loginScreen': (context) => const LoginScreen(),
      },
    );
  }
}
