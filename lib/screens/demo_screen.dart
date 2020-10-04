import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  DemoScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlatButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('Click me')),
        ],
      ),
    );
  }
}
