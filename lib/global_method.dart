import 'package:flutter/material.dart';
import 'package:novelty_app/screens/loginscreen.dart';
import 'package:novelty_app/screens/signupscreen.dart';

class GlobalMethods {
  Future<void> Notfound(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.error),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6.0, 8.0, 8.0, 8.0),
                  child: Text(
                    'حدث خطأ',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                )
              ],
            ),
            content: Text(
              'لايوجد  لدينا مستخدم بهذه المعلومات',
              style: TextStyle(fontFamily: 'Cairo'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'حسنا',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          );
        });
  }

  Future<void> WrongPassword(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.error),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6.0, 8.0, 8.0, 8.0),
                  child: Text(
                    'حدث خطأ',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                )
              ],
            ),
            content: Text(
              'كلمة مرور خاطئة',
              style: TextStyle(fontFamily: 'Cairo'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'حسنا',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          );
        });
  }

  Future<void> OtherSignin(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.error),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6.0, 8.0, 8.0, 8.0),
                  child: Text(
                    'حدث خطأ',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                )
              ],
            ),
            content: Text(
              'الرجاء ادخال المعلومات بالطريقة الصحيحة',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 15.0),
              
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'حسنا',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          );
        });
  }

  Future<void> OtherSignup(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.error),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(6.0, 8.0, 8.0, 8.0),
                  child: Text(
                    'حدث خطأ',
                    style: TextStyle(fontFamily: 'Cairo'),
                  ),
                )
              ],
            ),
            content: Text(
              'الرجاء ادخال المعلومات بالطريقة الصحيحة',
              style: TextStyle(fontFamily: 'Cairo',fontSize: 15.0),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(
                  'حسنا',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              )
            ],
          );
        });
  }
}
