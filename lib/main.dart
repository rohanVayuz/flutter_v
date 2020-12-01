import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_v/animScreen.dart';
import 'package:flutter_v/fitScreen.dart';
import 'package:flutter_v/pay_homepage.dart';
import 'package:flutter_v/playlist_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapioca/src/video_editor.dart';
import 'package:tapioca/tapioca.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final navigatorKey = GlobalKey<NavigatorState>();
  File _video;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await VideoEditor.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  _pickVideo() async {
    try {
      PickedFile video =
          await ImagePicker.platform.pickVideo(source: ImageSource.gallery);
      print(video.path);
      setState(() {
        _video = File(video.path);
        print("==================================");
        print("VIDEO PICKED : " + video.path);
        print("==================================");

        isLoading = true;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text("Pick a video and Edit it"),
                        color: Colors.orange,
                        textColor: Colors.white,
                        onPressed: () async {
                          print("clicked!");
                          await _pickVideo();
                          var tempDir = await getTemporaryDirectory();
                          final path = '${tempDir.path}/result.mp4';
                          print(tempDir);
                          final imageBitmap =
                              (await rootBundle.load("assets/image.png"))
                                  .buffer
                                  .asUint8List();
                          try {
                            final tapiocaBalls = [
                              TapiocaBall.filter(Filters.blue),
                              TapiocaBall.imageOverlay(imageBitmap, 100, 100),
                              TapiocaBall.textOverlay(
                                  "ROHAN", 10, 10, 48, Color(0xff181818)),
                            ];
                            if (_video != null) {
                              final cup =
                                  Cup(Content(_video.path), tapiocaBalls);
                              cup.suckUp(path).then((_) async {
                                print("finished");
                                GallerySaver.saveVideo(path)
                                    .then((bool success) {
                                  print(success.toString());
                                });
                                navigatorKey.currentState.push(
                                  MaterialPageRoute(
                                      builder: (context) => VideoScreen(path)),
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            } else {
                              print("video is null");
                            }
                          } on PlatformException {
                            print("error!!!!");
                          }
                        },
                      ),
                      // RaisedButton(
                      //   child: Text("AnimScreen"),
                      //   onPressed: () {
                      //     navigatorKey.currentState.push(
                      //       MaterialPageRoute(
                      //           builder: (context) => AnimScreen()),
                      //     );
                      //   },
                      // ),
                      RaisedButton(
                        child: Text("FitScreen Clone"),
                        onPressed: () {
                          navigatorKey.currentState.push(
                            MaterialPageRoute(builder: (context) => FIt2()),
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("Google Pay"),
                        onPressed: () {
                          navigatorKey.currentState.push(
                            MaterialPageRoute(
                                builder: (context) => GpHomepage()),
                          );
                        },
                      ),
                      RaisedButton(
                        child: Text("Playlist Screen"),
                        onPressed: () {
                          navigatorKey.currentState.push(
                            MaterialPageRoute(
                                builder: (context) => PlaylistScreen()),
                          );
                        },
                      ),

                    ],
                  )),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String path;

  VideoScreen(this.path);

  @override
  _VideoAppState createState() => _VideoAppState(path);
}

class _VideoAppState extends State<VideoScreen> {
  final String path;

  _VideoAppState(this.path);

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(path))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
