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
    randomNumber = random.nextInt(60);
    AssetsAudioPlayer.playAndForget(
      Audio("assets/audios/${widget.audioFile[randomNumber].filePath}"),
    );
    print(randomNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${widget.audioFile[randomNumber].text}',
                style: TextStyle(fontSize: 24),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      randomPlayer();
                    });
                  },
                  child: Text('ランダムに再生'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
