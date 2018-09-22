import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      return _DashboardState();
    }
}

class _DashboardState extends State<Dashboard> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Text('Dashboard')
      );
    }
} 