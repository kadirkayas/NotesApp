import 'package:flutter/material.dart';
import 'package:notes_app/widgets/chemic_list_item.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.asset(
                'videos/IntroVideo.mp4',
              ),
              looping: true,
            ),
          ),
          Container(
            height: 300.0,
            child: ChewieListItem(
              videoPlayerController: VideoPlayerController.network(
                'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
              ),
              looping: true,
            ),
          )
        ],
      ),
    );
  }
}
