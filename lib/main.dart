import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nishimura_hiroyuki_voice/audioItem/audioItem1.dart';
import 'package:nishimura_hiroyuki_voice/random_tab_item.dart';
import 'package:nishimura_hiroyuki_voice/services/admob.dart';
import 'package:nishimura_hiroyuki_voice/tab_item.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
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
      debugShowCheckedModeBanner: false,
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
    SampleTabItem(audioItem1),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ひまゆきラジオ"),
        // backgroundColor: Colors.blue,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AdmobBanner(
            adUnitId: AdMobService().getBannerAdUnitId(),
            adSize: AdmobBannerSize(
              width: MediaQuery.of(context).size.width.toInt(),
              height: AdMobService().getHeight(context).toInt(),
              name: 'SMART_BANNER',
            ),
          ),
          BottomNavigationBar(
            onTap: onTabTapped,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.campaign),
                label: 'ランダム',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.volume_up),
                label: '名言集',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
