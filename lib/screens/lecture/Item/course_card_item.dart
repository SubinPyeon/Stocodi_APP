import 'package:flutter/material.dart';
import '../../../theme/class_room_theme.dart';
import '../lecture.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class CourseCardItem extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseImage;
  final String videoId;

  const CourseCardItem({
    Key? key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.videoId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.5;
    double cardHeight = cardWidth * 0.8;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Lecture(courseCardItem: this,),
          ),
        );
      },
      child: IntrinsicHeight(
        child: Container(
          width: cardWidth,
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: cardWidth,
                height: cardHeight * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(courseImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(courseTitle, style: textTheme.displayMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(courseDescription, style: textTheme.displaySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
