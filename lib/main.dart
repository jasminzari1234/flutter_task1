// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         // When navigating to the "/" route, build the FirstScreen widget.
//         '/': (context) => MyApp(),
//         // When navigating to the "/second" route, build the SecondScreen widget.
//         '/second': (context) => SecondRoute(),
//       },
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Audio Video Player"),
//         ),
//         body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           margin: EdgeInsets.all(30),
//           alignment: Alignment.center,
//           color: Colors.yellow.shade200,
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Card(
//                   color: Colors.redAccent,
//                   child: RaisedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/second');
//                     },
//                     child: Text("music"),
//                   ),
//                 ),
//                 Card(
//                   color: Colors.redAccent,
//                   child: RaisedButton(
//                     onPressed: () {
//                       print("hello");
//                     },
//                     child: Text("Video"),
//                   ),
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    debugShowCheckedModeBanner: false,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => FirstScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => SecondScreen(),
      '/third': (context) => ThirdScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Video player'),
        actions: <Widget>[
          Icon(Icons.comment),
          Icon(Icons.settings),
        ],
        backgroundColor: Colors.deepPurpleAccent.shade100,
        elevation: 50.0,
        leading: Icon(Icons.menu),
        bottom: PreferredSize(
            child: Icon(
              Icons.linear_scale,
              size: 60.0,
            ),
            preferredSize: Size.fromHeight(50.0)),
      ),
      body: Container(
        color: Colors.black,
        child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(top: 200, bottom: 200, left: 50, right: 50),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.music_note,
                          color: Colors.blue,
                          size: 30,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            Navigator.pushNamed(context, '/second');
                          },
                          child: Text(
                            "music",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          color: Colors.red,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.video_label,
                          size: 30,
                          color: Colors.blue,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThirdScreen()),
                            );
                          },
                          child: Text(
                            "video",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          color: Colors.red,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text(
          "Audio",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 50.0,
        leading: Icon(
          Icons.music_note,
          color: Colors.black,
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 70, right: 50, top: 20, bottom: 20),
                      color: Colors.red,
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LocalAudio()),
                        );
                      },
                      child: Text('Downloads'),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 50, right: 80, top: 20, bottom: 20),
                      color: Colors.red,
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ListSongs()),
                        );
                      },
                      child: Text('Online'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Recently played",
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade400,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Recently added",
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade400,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "My files",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 300),
                color: Colors.grey.shade400,
                height: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // Navigate back to the first screen by popping the current route
                      // off the stack.
                      Navigator.pop(context);
                    },
                    child: Text('Go back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title: Text(
          "Video",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 50.0,
        leading: Icon(
          Icons.video_label,
          size: 30,
          color: Colors.black,
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 70, right: 50, top: 20, bottom: 20),
                      color: Colors.red,
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoAsset()),
                        );
                      },
                      child: Text('Downloads'),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(
                          left: 50, right: 80, top: 20, bottom: 20),
                      color: Colors.red,
                      onPressed: () {
                        // Navigate back to the first screen by popping the current route
                        // off the stack.
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoApp()),
                        );
                      },
                      child: Text('Online'),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Albums",
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade400,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Latest",
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey.shade400,
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: <Widget>[
                    Text(
                      "My folders",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 300),
                color: Colors.grey.shade400,
                height: 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      // Navigate back to the first screen by popping the current route
                      // off the stack.
                      Navigator.pop(context);
                    },
                    child: Text('Go back'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListSongs extends StatelessWidget {
  Widget build(BuildContext context) {
    mytoast() {
      Fluttertoast.showToast(
          msg: " Play music!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueAccent.shade100,
          textColor: Colors.white,
          fontSize: 20.0);
    }

// ignore: unused_local_variable
    var myLeadingIconAudio = Icon(
      Icons.arrow_back,
      color: Colors.red,
    );

    // ignore: unused_local_variable
    var myLeadingButtonAudio = IconButton(
        icon: myLeadingIconAudio,
        onPressed: () {
          Navigator.pop(context);
        });

    var dotIconAudio = Icon(
      Icons.more_vert,
      color: Colors.white,
    );

    var dotIconButtonAudio = IconButton(icon: dotIconAudio, onPressed: mytoast);

    FlutterStatusbarcolor.setStatusBarColor(Colors.black);

    var myAppBarMusic = AppBar(
      backgroundColor: Colors.black87,
      title: Text('My  online Playlist'),
      leading: myLeadingButtonAudio,
      actions: <Widget>[
        dotIconButtonAudio,
      ],
    );

    var videoPlayerController = VideoPlayerController.network(
        'https://github.com/jasminzari1234/flutter-media/raw/master/WhatsApp%20Video%202020-08-07%20at%2014.11.51.mp4');

    var audio = ChewieAudioController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.greenAccent,
        handleColor: Colors.red,
        backgroundColor: Colors.black,
        bufferedColor: Colors.amberAccent,
      ),
      autoInitialize: true,
    );

    var videoPlayerController2 = VideoPlayerController.network(
        'https://github.com/jasminzari1234/flutter-media/raw/master/1503837097809.mp4');

    var audio2 = ChewieAudioController(
      videoPlayerController: videoPlayerController2,
      autoPlay: false,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        backgroundColor: Colors.black54,
        bufferedColor: Colors.lightGreen,
      ),
      autoInitialize: true,
    );

    var videoPlayerController3 = VideoPlayerController.network(
        'https://github.com/jasminzari1234/flutter-media/raw/master/1503837097809.mp4');

    var audio1 = ChewieAudioController(
      videoPlayerController: videoPlayerController3,
      autoPlay: false,
      looping: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        backgroundColor: Colors.black54,
        bufferedColor: Colors.lightGreen,
      ),
      autoInitialize: true,
    );
    var myAudioBody = Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Card(
                  child: Image.asset(
                    "images/piku.jpg",
                    width: 300,
                  ),
                ),
                Container(
                  width: 600,
                  margin: EdgeInsets.all(10),
                  height: 50,
                  child: ChewieAudio(
                    controller: audio,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: ChewieAudio(
                controller: audio2,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: ChewieAudio(
                controller: audio1,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              child: ChewieAudio(
                controller: audio1,
              ),
            ),
          ],
        ));

    var home = Scaffold(
      appBar: myAppBarMusic,
      body: myAudioBody,
    );

    var musicPage = MaterialApp(
      home: home,
      debugShowCheckedModeBanner: false,
    );
    return musicPage;
  }
}

// ignore: must_be_immutable
class LocalAudio extends StatelessWidget {
  AudioPlayer advancedPlayer;
  Widget build(BuildContext context) {
    mytoast() {
      Fluttertoast.showToast(
          msg: " Play music!!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueAccent.shade100,
          textColor: Colors.white,
          fontSize: 20.0);
    }

// ignore: unused_local_variable
    var myLeadingIconAudio = Icon(
      Icons.arrow_back,
      color: Colors.red,
    );

    // ignore: unused_local_variable
    var myLeadingButtonAudio = IconButton(
        icon: myLeadingIconAudio,
        onPressed: () {
          Navigator.pop(context);
        });

    var dotIconAudio = Icon(
      Icons.more_vert,
      color: Colors.white,
    );

    var dotIconButtonAudio = IconButton(icon: dotIconAudio, onPressed: mytoast);

    FlutterStatusbarcolor.setStatusBarColor(Colors.black);

    var myAppBarMusic = AppBar(
      backgroundColor: Colors.black87,
      title: Text('My  offline Playlist'),
      leading: myLeadingButtonAudio,
      actions: <Widget>[
        dotIconButtonAudio,
      ],
    );

    var home = Scaffold(
      appBar: myAppBarMusic,
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/wo din.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () async {
                      advancedPlayer = await AudioCache().loop('audio/jaz.mp3');
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.pause();
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/darkside.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () async {
                      advancedPlayer = await AudioCache().loop("audio/AW.mp3");
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.pause();
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/ilahi.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () async {
                      advancedPlayer =
                          await AudioCache().loop("audio/illahi.mp3");
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.pause();
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(10),
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/kaise hua.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () async {
                      advancedPlayer =
                          await AudioCache().loop("audio/kaise hua.mp3");
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.pause();
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/zalima.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    color: Colors.white,
                    onPressed: () async {
                      advancedPlayer =
                          await AudioCache().loop("audio/zalima.mp3");
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.pause),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.pause();
                    },
                  ),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.stop),
                    color: Colors.white,
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.play_arrow),
                    onPressed: () async {
                      await advancedPlayer.stop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    var musicPage = MaterialApp(
      home: home,
      debugShowCheckedModeBanner: false,
    );
    return musicPage;
  }
}

class VideoApp extends StatefulWidget {
  VideoApp() : super();

  final String title = "Video App";
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  Future<void> _intializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      "https://media.istockphoto.com/videos/sunrise-over-a-sandstone-arch-formations-video-id625882314",
    );
    _intializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);

    t1() {
      Fluttertoast.showToast(
        msg: "Played",
        gravity: ToastGravity.BOTTOM_LEFT,
        fontSize: 20.0,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    t2() {
      Fluttertoast.showToast(
        msg: "Paused",
        gravity: ToastGravity.BOTTOM_LEFT,
        fontSize: 20.0,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    var myLeadingIconAudio = Icon(
      Icons.arrow_back,
      color: Colors.black,
    );

    // ignore: unused_local_variable
    var myLeadingButtonAudio = IconButton(
        icon: myLeadingIconAudio,
        onPressed: () {
          Navigator.pop(context);
        });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Online'),
          leading: myLeadingButtonAudio,
          backgroundColor: Colors.redAccent.shade200,
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: 500,
              //color: Colors.blueAccent,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                border: Border.all(
                  color: Colors.black,
                  width: 6,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                      future: _intializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              t2();
                              _controller.pause();
                            } else {
                              t1();
                              _controller.play();
                            }
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Card(
                          color: Colors.red,
                          child: Text(
                            " Pause  ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            t1();
                            _controller.play();
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Card(
                          color: Colors.red,
                          child: Text(
                            " Play  ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/nature1.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/nature2.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/nature3.jpg'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 50,
                  child: Icon(
                    Icons.stop,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              color: Colors.red,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class VideoAsset extends StatefulWidget {
  VideoAsset() : super();

  final String title = "Video App";
  @override
  _VideoAssetState createState() => _VideoAssetState();
}

class _VideoAssetState extends State<VideoAsset> {
  VideoPlayerController _controller;
  Future<void> _intializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      "assets/jaz.mp4",
    );
    _intializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.black);

    t1() {
      Fluttertoast.showToast(
        msg: " Played",
        gravity: ToastGravity.BOTTOM_LEFT,
        fontSize: 20.0,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    t2() {
      Fluttertoast.showToast(
        msg: "Paused",
        gravity: ToastGravity.BOTTOM_LEFT,
        fontSize: 20.0,
        textColor: Colors.black,
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    var myLeadingIconAudio = Icon(
      Icons.arrow_back,
      color: Colors.black,
    );

    // ignore: unused_local_variable
    var myLeadingButtonAudio = IconButton(
        icon: myLeadingIconAudio,
        onPressed: () {
          Navigator.pop(context);
        });

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Asset'),
          backgroundColor: Colors.red.shade600,
          leading: myLeadingButtonAudio,
        ),
        backgroundColor: Colors.black26,
        body: Center(
          child: Container(
            height: 500,
            //color: Colors.blueAccent,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: <Widget>[
                FutureBuilder(
                    future: _intializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            t2();
                            _controller.pause();
                          } else {
                            t1();
                            _controller.play();
                          }
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Card(
                        color: Colors.red,
                        child: Text(
                          " Pause  ",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          t1();
                          _controller.play();
                        });
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Card(
                        color: Colors.red,
                        child: Text(
                          " Play  ",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
