import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scifiworld/pages/dashboard/widgets/navigationBar.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backButtonClicked();
      },
      child: Scaffold(
        body:  Container(
          padding: EdgeInsets.only(top:24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                NavigationBar()
              ],
            ),
          )
        )
      ),
    );
  }

  Future<Null> _backButtonClicked() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Are you sure to exit the application?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Okay'),
              onPressed: () {
                exit(0);
              },
            ),
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
