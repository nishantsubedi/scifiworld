import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  String activeButton;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _backButtonClicked();
      },
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.only(top: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColorDark,
                      height: 60.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.home,
                              color: activeButton == 'home'
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                            iconSize: 40.0,
                            onPressed: (){
                              setState(() {
                                activeButton = 'home';
                              });
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          FlatButton(
                              child: Opacity(
                            opacity: 0.9,
                            child: Image.asset(
                              "images/news_icon.png",
                              color: activeButton == 'news'
                                  ? Colors.white
                                  : Colors.white70,
                              height: 40.0,
                              width: 40.0,
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                                activeButton = 'news';
                              });
                          },),
                          SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: activeButton == 'notification'
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                            iconSize: 40.0,
                            onPressed: (){
                              setState(() {
                                activeButton = 'notification';
                              });
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.dehaze,
                              color: activeButton == 'control'
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                            iconSize: 40.0,
                            onPressed: () {
                              setState(() {
                                activeButton = 'control';
                              });
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
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
              child: new Text(
                'Okay',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              onPressed: () {
                exit(0);
              },
            ),
            new FlatButton(
              child: new Text(
                'Cancel',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
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
