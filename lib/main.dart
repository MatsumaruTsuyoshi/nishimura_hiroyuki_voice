import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nishimura_hiroyuki_voice/audioItem/audioItem1.dart';
import 'package:nishimura_hiroyuki_voice/random_tab_item.dart';
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
    // SampleTabItem("真ん中の画面", Colors.white, audioItem1),
    // SampleTabItem("右の画面", Colors.white, audioItem1),
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
          // AdmobBanner(
          //   adUnitId: AdMobService().getBannerAdUnitId(),
          //   adSize: AdmobBannerSize(
          //     width: MediaQuery.of(context).size.width.toInt(),
          //     height: AdMobService().getHeight(context).toInt(),
          //     name: 'SMART_BANNER',
          //   ),
          // ),
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
              // BottomNavigationBarItem(
              //   icon: new Icon(Icons.volume_up),
              //   label: '人生',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.volume_up),
              //   label: '感情',
              // )
            ],
          ),
        ],
      ),
    );
  }
}

//test
//・アプリID（テスト用）
//Android: ca-app-pub-3940256099942544~3347511713
//iOS: ca-app-pub-3940256099942544~1458002511
//
//・広告ユニットID（テスト用）
//Android: ca-app-pub-3940256099942544/6300978111
//iOS: ca-app-pub-3940256099942544/2934735716

//本番
//・アプリID（本番用）
//Android:　ca-app-pub-4989096156725519~5659162118
//iOS:　ca-app-pub-4989096156725519~2183785682
//
//・広告ユニットID（本番用）
//Android:　ca-app-pub-4989096156725519/3113723978
//iOS:　ca-app-pub-4989096156725519/2207836417
