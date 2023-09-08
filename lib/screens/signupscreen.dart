import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailCtrlr = TextEditingController();
  final _passCtrlr = TextEditingController();
  final _ConfirmpassCtrlr = TextEditingController();

  Future Sign_up() async {
    if (passwordConfirmed()) {
      // try {
      //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //     email: _emailCtrlr.text.trim(),
      //     password: _passCtrlr.text.trim(),
      //   );
      //   Navigator.of(context).pushReplacementNamed('/');
      // } catch (e) {
      //   //TODO: throw alert in the app
      //   print(e);
      // }

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _emailCtrlr.text.trim(), password: _passCtrlr.text.trim())
          // TODO input for selecting user role
          .then((value) => {postDetailsToFirestore(_emailCtrlr.text.trim(), "parent")})
          .catchError((e) {
            // TODO: throw an alert for the user when error occours 
            print(e.toString());
          })
          .then((value) => Navigator.of(context).pushReplacementNamed('/'));
    }
  }

  postDetailsToFirestore(String email, String rool) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': email, 'role': rool});
  }

  bool passwordConfirmed() {
    if (_passCtrlr.text.trim() == _ConfirmpassCtrlr.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void openSigninScreen() {
    Navigator.of(context).pushReplacementNamed('loginScreen');
  }

  @override
  void dispose() {
    super.dispose();
    _emailCtrlr.dispose();
    _passCtrlr.dispose();
    _ConfirmpassCtrlr.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade600,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Image.asset(
                'images/noveltyicon.png',
                height: 155,
              ),
              SizedBox(
                height: 20,
              ),

              //title
              Text(
                '!أهلاً بك',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo'),
              ),
              SizedBox(
                height: 30,
              ),
              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: _emailCtrlr,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _passCtrlr,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //Confirm Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _ConfirmpassCtrlr,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password'),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              ),

              //sign up button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: Sign_up,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'تسجيل',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: openSigninScreen,
                    child: Text(
                      'سجل دخولك من هنا ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                    ),
                  ),
                  Text(
                    'أنت عضو لدينا؟',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
