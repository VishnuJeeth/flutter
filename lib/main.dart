import 'ui/videoassets.dart';
import 'ui/audioassets.dart';
import 'ui/videoonline.dart';
import 'ui/audioonline.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        DefaultTabController,
        Icon,
        Icons,
        LinearGradient,
        MaterialApp,
        Scaffold,
        StatelessWidget,
        Tab,
        TabBar,
        TabBarView,
        Text,
        Widget,
        runApp;

main() {
  runApp(AudioVideo());
}

class AudioVideo extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Audio & Video"),
            backgroundColor: Colors.blueAccent,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.music_note),
                  text: "Songs",
                ),
                Tab(
                  icon: Icon(Icons.library_music),
                  text: "Songs Online",
                ),
                Tab(
                  icon: Icon(Icons.featured_video),
                  text: "Videos",
                ),
                Tab(
                  icon: Icon(Icons.video_library),
                  text: "Videos Online",
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [.1, .9],
                  colors: [Colors.red.shade300, Colors.cyanAccent]),
            ),
            child: TabBarView(
              children: [
                LocalAudio(),
                NetworkAudio(),
                LocalVideo(),
                NetworkVideo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
