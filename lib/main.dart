import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'page/MainPage.dart';

void main() {
  //设置状态栏透明
  if(Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  runApp(new SplashPage());
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //去除右上角的Debug标签
        debugShowCheckedModeBanner: false,
        home: new SplashHome());
  }
}

class SplashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints.expand(
            width: double.infinity, height: double.infinity),
        child: Stack(
          children: [
            Image.asset("assets/images/ic_splash.jpg",
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity),
            Positioned(top: 30, right: 30, child: JumpWidget())
          ],
        ));
  }
}

class JumpWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new JumpWidgetState();
  }
}

class JumpWidgetState extends State<JumpWidget> {
  int currentTimer = 5;
  Timer _timer;

  Future pushMain(BuildContext context) {
    // return Navigator.of(context).push(new MaterialPageRoute(
    //     builder: (context) => new MainPage(
    //           title: "从启动页跳转到首页",
    //         )));
  
    return Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(
        builder: (context) => new MainPage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      currentTimer--;
      print("currentTimer#####$currentTimer");
      if (currentTimer == 0) {
        _timer.cancel();
        pushMain(context);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        new GestureDetector(
            onTap: () => {pushMain(context)},
            child: Text("跳过$currentTimer",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 16)))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
