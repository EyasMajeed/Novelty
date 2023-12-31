import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novelty_app/global_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrlr = TextEditingController();
  final _passCtrlr = TextEditingController();
  GlobalMethods _globalMethods = GlobalMethods();

  Future Sign_in() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailCtrlr.text.trim(), password: _passCtrlr.text.trim());
      Navigator.of(context).pushReplacementNamed('/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _globalMethods.Notfound(context);
      } else if (e.code == 'wrong-password') {
        _globalMethods.WrongPassword(context);
      } else {
        _globalMethods.OtherSignin(context);
      }
    }
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrlr.text.trim(), password: _passCtrlr.text.trim());
  }

  void openSignupScreen() {
    Navigator.of(context).pushReplacementNamed('signupScreen');
  }

  @override
  void dispose() {
    super.dispose();
    _emailCtrlr.dispose();
    _passCtrlr.dispose();
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
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Cairo',
                          )),
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
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Cairo',
                            )),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 40,
              ),

              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: Sign_in,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'تسجيل الدخول',
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
                    onTap: openSignupScreen,
                    child: Text(
                      'تسجيل جديد ',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cairo'),
                    ),
                  ),
                  Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(fontFamily: 'Cairo'),
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
