import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

import '../../utill/app_size.dart';

class VideoApp extends StatefulWidget {
  final String videoLink;
  const VideoApp({super.key, required this.videoLink});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  RxBool isVideoLoading = true.obs;

  @override
  void initState() {
    super.initState();
    playVideo();
  }

  void playVideo() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoLink),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,
          allowBackgroundPlayback: true,
        ))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          isVideoLoading.value = false;
        });
      });
    _controller.setLooping(true);
    _controller.setVolume(0);
  }

  @override
  Widget build(BuildContext context) {
    //_controller.play();
    return Container(
      height: screenHeight / 2,
      width: screenWidth,
      color: Colors.black,
      margin: const EdgeInsets.all(8),
      child: Scaffold(
        body: isVideoLoading.value == true
            ? Center(
                child: Lottie.asset("assets/json/loading.json",
                    fit: BoxFit.cover,
                    height: screenHeight * 0.095,
                    width: screenWidth * 0.095),
              )
            : Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _controller.value.isPlaying
        //           ? _controller.pause()
        //           : _controller.play();
        //     });
        //   },
        //   child: Icon(
        //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }
}
