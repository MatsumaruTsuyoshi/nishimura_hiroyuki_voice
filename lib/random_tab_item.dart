import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:nishimura_hiroyuki_voice/domain/audioFile.dart';
import 'dart:math' as math;

class RandomTabItem extends StatefulWidget {
  final Map<int, AudioFile> audioFile; //上位Widgetから受け取りたいデータ
  RandomTabItem({@required this.audioFile}); //コンストラクタ

  @override
  _RandomTabItemState createState() => _RandomTabItemState();
}

class _RandomTabItemState extends State<RandomTabItem> {
  int randomNumber = 0;
  final assetsAudioPlayer = AssetsAudioPlayer();

  void randomPlayer() {
    var random = math.Random();
    randomNumber = random.nextInt(24);
    assetsAudioPlayer.open(
      Audio("assets/audios/${widget.audioFile[randomNumber].filePath}"),
    );

    assetsAudioPlayer.play();
    print(assetsAudioPlayer.onErrorDo);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.audioFile[randomNumber].text}',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  randomPlayer();
                });
              },
              child: Text('ランダムに再生'),
            ),
          ],
        ),
      ),
    );
  }
}
