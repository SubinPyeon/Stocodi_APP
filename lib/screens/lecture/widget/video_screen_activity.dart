import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/widget/video_lecture.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import '../Test/figmatoflutterTest.dart';

class VideoScreenActivity extends StatefulWidget {
  const VideoScreenActivity({Key? key}) : super(key: key);

    @override
  _VideoScreenActivityState createState() => _VideoScreenActivityState();
}

class _VideoScreenActivityState extends State<VideoScreenActivity> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          VideoLecture(),
          VideoDetails(),
        ],
      ),
    );
  }
}