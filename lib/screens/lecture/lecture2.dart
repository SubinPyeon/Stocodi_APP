import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/lecture/Item/total_course_item.dart';
import 'package:stocodi_app/screens/lecture/widget/lecture_tab.dart';
import 'package:stocodi_app/screens/lecture/widget/video_screen_activity2.dart';

class Lecture2 extends StatefulWidget {
  final ClassRoomTotalItem courseCardItem;
  final Function onReturnFromLecture;

  const Lecture2({
    Key? key,
    required this.courseCardItem,
    required this.onReturnFromLecture,
  }) : super(key: key);

  @override
  _LectureState2 createState() => _LectureState2();
}

class _LectureState2 extends State<Lecture2> {
  late ClassRoomTotalItem courseCardItem;
  bool isLectureTabVisible = true; // 가시성 상태를 추적

  @override
  void initState() {
    super.initState();
    courseCardItem = widget.courseCardItem;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 1,
          itemBuilder: (BuildContext outerContext, int outerIndex) {
            return Column(
              children: [
                VideoScreenActivity2(
                    courseCardItem: courseCardItem,
                    onReturnFromLecture: widget.onReturnFromLecture,
                    isFullScreen: (visible){
                      setState(() {
                        isLectureTabVisible = visible;
                      });
                    }
                ),
                isLectureTabVisible ?
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: screenHeight*0.425,
                      child: LectureTab(lectureId: courseCardItem.lectureId),
                    ),
                  ],
                ) :Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
