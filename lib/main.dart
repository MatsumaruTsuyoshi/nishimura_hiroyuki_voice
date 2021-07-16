import 'package:flutter/material.dart';
import 'package:nishimura_hiroyuki_voice/audioItem/audioItem1.dart';
import 'package:nishimura_hiroyuki_voice/random_tab_item.dart';
import 'package:nishimura_hiroyuki_voice/tab_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> tabs = [
    // TabPagerItem(),
    RandomTabItem(audioFile: audioItem1),
    SampleTabItem("左の画面", Colors.white, audioItem1),
    SampleTabItem("真ん中の画面", Colors.white, audioItem1),
    SampleTabItem("右の画面", Colors.white, audioItem1),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("にしむらひろゆきボイス"),
        // backgroundColor: Colors.blue,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.campaign),
            label: 'ランダム',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.volume_up),
            label: '論破',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.volume_up),
            label: '人生',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.volume_up),
            label: '感情',
          )
        ],
      ),
    );
  }
}
