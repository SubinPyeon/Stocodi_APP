import 'package:flutter/material.dart';
import '../../../model/lecture/response/lecture_response.dart';
import '../../../theme/class_room_theme.dart';
import 'classroom_course_item.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yt;

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomCourseListItem extends StatelessWidget {
  final String courseTitle;
  final List<LectureResponse> courseList;

  const ClassRoomCourseListItem({
    Key? key,
    required this.courseTitle,
    required this.courseList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.backgroundColor,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 4),
                      child: Text(courseTitle, style: textTheme.displayLarge),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 4),
                      child: Icon(Icons.chevron_right, color: theme.primaryColor, size: 35),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: FutureBuilder<List<Widget>>(
                  future: buildCourseCards(courseList),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Row(children: snapshot.data ?? []);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<Widget>> buildCourseCards(List<LectureResponse> courseList) async {
    var ytInstance = yt.YoutubeExplode(); // YouTube 인스턴스 생성
    List<Widget> courseCards = [];

    for (var courseData in courseList) {
      var video = await ytInstance.videos.get(courseData.video_link);
      var courseImage = video.thumbnails.highResUrl;

      var courseCard = ClassRoomCourseItem(
        courseTitle: courseData.title,
        courseDescription: courseData.description,
        courseImage: courseImage,
        videoLink: courseData.video_link,
        lectureId: courseData.id,
      );
      courseCards.add(courseCard);
    }

    ytInstance.close(); // 사용이 끝난 후 인스턴스를 닫아주는 것이 좋아요.
    return courseCards;
  }
}
