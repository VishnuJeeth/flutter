import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<void> initializePlayer;
VideoPlayerController videoPlayerController;

class NetworkVideo extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  build(BuildContext b) {
    return Column(
      children: <Widget>[
        FutureBuilder(
            future: initializePlayer,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(child: VideoPlayer(videoPlayerController)),
                );
              } else {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.black,
                  ),
                );
              }
            }),
        Container(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/dilbechara.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(80.0),
              ),
            ),
            Container(
              height: 50,
              child: IconButton(
                icon: Icon(Icons.play_arrow),
                color: Colors.black,
                onPressed: () {
                  setState(() {});
                  videoPlayerController = VideoPlayerController.network(
                      "https://github.com/SatyaBhashiniNandigam/fluttertask1/raw/master/videoonline/dilbechara.mp4");
                  initializePlayer = videoPlayerController.initialize();
                  videoPlayerController.setVolume(1.0);
                  //videoPlayerController.initialize();
                  videoPlayerController.play();
                  // setup();
                },
              ),
            ),
            Container(
              height: 50,
              child: IconButton(
                icon: Icon(Icons.pause),
                color: Colors.black,
                onPressed: () {
                  videoPlayerController.pause();
                  //videoPlayerController.dispose();
                },
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/channamereya.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(80.0),
              ),
            ),
            Container(
              height: 50,
              child: IconButton(
                icon: Icon(Icons.play_arrow),
                color: Colors.black,
                onPressed: () {
                  setState(() {});
                  videoPlayerController = VideoPlayerController.network(
                      "https://github.com/SatyaBhashiniNandigam/fluttertask1/raw/master/videoonline/channamereya.mp4");
                  initializePlayer = videoPlayerController.initialize();
                  videoPlayerController.setVolume(1.0);
                  //videoPlayerController.initialize();
                  videoPlayerController.play();
                },
              ),
            ),
            Container(
              height: 50,
              child: IconButton(
                icon: Icon(Icons.pause),
                color: Colors.black,
                onPressed: () {
                  videoPlayerController.pause();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
