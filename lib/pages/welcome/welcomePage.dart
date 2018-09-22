import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scifiworld/pages/dashboard/dashboard.dart';
import 'package:scifiworld/services/preferenceService.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int isVisited = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildHomeStack(),
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
        _buildGetStartedButton(context)
      ],
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    if (isVisited == 0) {
      PreferenceService.get().getVisited().then((val) {
        if (val) {
          setState(() {
            isVisited = 1;
          });
        } else {
          isVisited = 2;
        }
      });
      return Container();
    } else if (isVisited == 1) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Dashboard();
        }));
      });
      return Container();
    } else {
      return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.2,
        left: MediaQuery.of(context).size.width * 0.4,
        child: Container(
          child: RaisedButton(
            child: Text(
              'Get Started',
              style: TextStyle(color: Colors.blueGrey.shade700),
            ),
            splashColor: Colors.blueGrey.shade200,
            onPressed: () {
              PreferenceService.get().setVisited(true);
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Dashboard();
              }));
            },
          ),
        ),
      );
    }
  }
}
