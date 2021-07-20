import 'dart:io';
import 'package:flutter/material.dart';

class AdMobService {
  String getBannerAdUnitId() {
    // iOSとAndroidで広告ユニットIDを分岐させる
    if (Platform.isAndroid) {
      // Androidの広告ユニットID
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      // iOSの広告ユニットID
      return 'ca-app-pub-4989096156725519/2207836417';
    }
    return null;
  }

  // 表示するバナー広告の高さを計算
  double getHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final percent = (height * 0.06).toDouble();

    return percent;
  }
}

//test
//・広告ユニットID（テスト用）
//Android: ca-app-pub-3940256099942544/6300978111
//iOS: ca-app-pub-3940256099942544/2934735716

//本番
//・広告ユニットID（本番用）
//Android:　ca-app-pub-4989096156725519/3113723978
//iOS:　ca-app-pub-4989096156725519/2207836417
