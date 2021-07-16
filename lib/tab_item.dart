import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:nishimura_hiroyuki_voice/domain/audioFile.dart';

class SampleTabItem extends StatelessWidget {
  final String title;
  final Color color;
  final Map<int, AudioFile> audioFile;

  final assetsAudioPlayer = AssetsAudioPlayer();

  SampleTabItem(this.title, this.color, this.audioFile) : super();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: this.color,
      body: new Container(
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(8),
          crossAxisCount: 4,
          children: audioFile.entries
              .map(
                (audioFile) => InkWell(
                  onTap: () {
                    AssetsAudioPlayer.playAndForget(
                      Audio("assets/audios/${audioFile.value.filePath}"),
                    );
                    print("assets/audios/${audioFile.value.filePath}");
                    // assetsAudioPlayer.play();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(8), //border corner radius
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), //color of shadow
                          spreadRadius: 0.5, //spread radius
                          blurRadius: 0.25, // blur radius
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        "${audioFile.value.text}",
                        style: TextStyle(fontSize: 10, height: 1.2),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
