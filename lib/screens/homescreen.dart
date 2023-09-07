import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getTimeLine() {
    double heightCon = 80.0;
    return Container(
      color: Colors.grey[50],
      margin: EdgeInsets.only(top: 10.0, bottom: 80.0),
      child: Column(children: <Widget>[
        new Container(
          height: heightCon,
          child: TimelineTile(
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(height: 1.0),
            alignment: TimelineAlign.manual,
            endChild: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  new Text(
                    'استلام الابن',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Cairo'),
                  )
                ],
              ),
            ),
          ),
        ),
        new Container(
          height: heightCon,
          child: TimelineTile(
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(height: 1.0),
            alignment: TimelineAlign.manual,
            endChild: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  new Text(
                    'وصل ابنك المدرسة',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Cairo'),
                  )
                ],
              ),
            ),
          ),
        ),
        new Container(
          height: heightCon,
          child: TimelineTile(
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(height: 1.0),
            alignment: TimelineAlign.manual,
            endChild: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  new Text(
                    'دخل ابنك الحافلة',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Cairo'),
                  )
                ],
              ),
            ),
          ),
        ),
        new Container(
          height: heightCon,
          child: TimelineTile(
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(height: 1.0),
            alignment: TimelineAlign.manual,
            endChild: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  new Text(
                    'اقترب ابنك من المنزل',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Cairo'),
                  )
                ],
              ),
            ),
          ),
        ),
        new Container(
          height: heightCon,
          child: TimelineTile(
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(height: 1.0),
            alignment: TimelineAlign.manual,
            endChild: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  new Text(
                    'وصل ابنك المنزل',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'Cairo'),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget getDriverInfo() {
    return Container(
      child: ListTile(
        title: Text(
          'سائق الحافلة',
          style: TextStyle(fontFamily: 'Cairo'),
        ),
        subtitle: Text(
          'محمد منير',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Cairo'),
        ),
        leading: Container(
          width: 75.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              image: DecorationImage(
                  image: AssetImage("images/driverphoto.jpg"),
                  fit: BoxFit.cover)),
        ),
        trailing: new Column(
          children: <Widget>[],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تتبع الابن',
          style: TextStyle(fontFamily: 'Cairo'),
        ),
        leading: IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout)),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 30.0)),
          new Text(
            'الوقت المقدر لوصول الابن ',
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cairo'),
            textAlign: TextAlign.center,
          ),
          new Text(
            '02:00PM',
            style: TextStyle(color: Colors.red, fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(
              color: Colors.grey[500],
            ),
          ),
          getDriverInfo(),
          getTimeLine(),
        ],
      ),
    );
  }
}
