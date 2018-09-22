import 'package:flutter/material.dart';
import 'package:scifiworld/pages/dashboard/dashboard.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        Positioned(
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
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Dashboard();
                }));
              },
            ),
          ),
        )
      ],
    );
  }
}
