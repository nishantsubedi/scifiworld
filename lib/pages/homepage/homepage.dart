import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backButtonClicked();
      },
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(),
        body: _buildHomeStack(),
      ),
    );
  }

  Widget _buildHomeStack() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 24.0),
          child: Image.asset(
            "images/home.png",
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.4,
          child: Container(
            child: RaisedButton(
              child: Text('Get Started', style: TextStyle(color:Colors.blueGrey.shade700),),
              splashColor: Colors.blueGrey.shade200,
              onPressed: (){},
            ),
          ),
        )
      ],
    );
  }

  Future<Null> _backButtonClicked() async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text(
            'Confirmation',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
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
