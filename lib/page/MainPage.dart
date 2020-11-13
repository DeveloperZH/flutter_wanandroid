import 'package:clife_app/page/HomeScene.dart';
import 'package:clife_app/page/ProjectScene.dart';
import 'package:clife_app/page/PublicScene.dart';
import 'package:clife_app/page/SquareScene.dart';
import 'package:clife_app/page/SystemTreeScene.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class  MainPageState extends State<MainPage>{
  int selectedIndex=0;
  List<Widget> mPageList =[ HomeScene(),
    SquareScene(),
    PublicScene(),
    SystemTreeScene(),
    ProjectScene()];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
        toolbarHeight: 50,
        leading: new Builder(builder:(context){
          return IconButton(icon: Icon(Icons.dashboard), onPressed: ()=>{
            Scaffold.of(context).openDrawer()
          });
        }
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.hot_tub_rounded),label: "广场"),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: "公众号"),
          BottomNavigationBarItem(icon: Icon(Icons.home_repair_service_rounded),label: "体系"),
          BottomNavigationBarItem(icon: Icon(Icons.home_work_sharp),label: "项目"),
        ],
        onTap: mBottomNavigationBarTab,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
      ),
      body: mPageList[selectedIndex],
    );
  }

  void mBottomNavigationBarTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
