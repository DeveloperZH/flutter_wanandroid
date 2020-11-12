import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  String title;

  MainPage({this.title = "defeat title"});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: new Text(this.title),
      ),
    );
  }
}
