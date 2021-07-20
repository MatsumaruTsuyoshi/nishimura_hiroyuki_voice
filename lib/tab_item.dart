import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:nishimura_hiroyuki_voice/domain/audioFile.dart';

class SampleTabItem extends StatelessWidget {
  final Map<int, AudioFile> audioFile;

  final assetsAudioPlayer = AssetsAudioPlayer();

  SampleTabItem(this.audioFile) : super();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var audio = audioFile.entries.map((e) => e.value).toList();
    return Scaffold(
      body: Container(
        child: Scrollbar(
          child: ListView.separated(
            padding: EdgeInsets.all(5),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                    title: Text(audio[index].text),
                    onTap: () {
                      AssetsAudioPlayer.playAndForget(
                        Audio("assets/audios/${audio[index].filePath}"),
                      );
                    }),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 0.1);
            },
            itemCount: audio.length,
          ),
        ),
      ),
    );
  }
}

// GridView.count(
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
// padding: const EdgeInsets.all(8),
// crossAxisCount: width > 500 ? 5 : 3,
// children: audioFile.entries
//     .map(
// (audioFile) => InkWell(
// onTap: () {
// AssetsAudioPlayer.playAndForget(
// Audio("assets/audios/${audioFile.value.filePath}"),
// );
// print("assets/audios/${audioFile.value.filePath}");
// // assetsAudioPlayer.play();
// },
// child: Container(
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(8), //border corner radius
// boxShadow: [
// BoxShadow(
// color:
// Colors.grey.withOpacity(0.5), //color of shadow
// spreadRadius: 0.5, //spread radius
// blurRadius: 0.25, // blur radius
// offset: Offset(0, 0), // changes position of shadow
// ),
// //you can set more BoxShadow() here
// ],
// ),
// padding: const EdgeInsets.all(8),
// child: Center(
// child: Text(
// "${audioFile.value.text}",
// style: TextStyle(
// fontSize: width > 500 ? 17 : 14, height: 1.2),
// ),
// ),
// ),
// ),
// )
// .toList(),
// ),
