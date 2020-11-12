import 'package:clife_app/page/MainPage.dart';
import 'package:flutter/material.dart';

void main() {
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
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: InkWell(
          child: new Text(
            "我是启动页\n点我跳转到首页",
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            print("跳转到首页");
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new MainPage(title: "我是传递的title",)));
          },
        ),
      ),
    );
  }
}
