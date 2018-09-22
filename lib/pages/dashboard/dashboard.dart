import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scifiworld/pages/homepage/homePage.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  int activeButton = 1;

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
                              color: activeButton == 1
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                            iconSize: 40.0,
                            onPressed: () {
                              setState(() {
                                activeButton = 1;
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
                                color: activeButton == 2
                                    ? Colors.white
                                    : Colors.white70,
                                height: 40.0,
                                width: 40.0,
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                activeButton = 2;
                              });
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: activeButton == 3
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                            iconSize: 40.0,
                            onPressed: () {
                              setState(() {
                                activeButton = 3;
                              });
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.dehaze,
                              color: activeButton == 4
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                            iconSize: 40.0,
                            onPressed: () {
                              setState(() {
                                activeButton = 4;
                              });
                            },
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: _buildBody(context, activeButton),
                    ),
                  ],
                ),
              ))),
    );
  }

  Widget _buildBody(BuildContext context, int activeButton) {
    if(activeButton == 1) return HomePage();
    return Text(activeButton.toString());
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
