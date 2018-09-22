import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ListTile(
                leading: Icon(Icons.theaters, color: Colors.white, size: 30.0,),
                title: Text('Movies', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ListTile(
                leading: Icon(Icons.live_tv, color: Colors.white, size: 30.0,),
                title: Text('TV Shows', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ListTile(
                leading: Icon(Icons.book, color: Colors.white, size: 30.0,),
                title: Text('Books and Comics', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              width: MediaQuery.of(context).size.width * 0.45,
              child: ListTile(
                leading: Icon(Icons.explore, color: Colors.white, size: 30.0,),
                title: Text('Technology', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
          ],
        )
      ],
    );
  }
}
