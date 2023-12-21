import 'package:flutter/material.dart';
import '../../../theme/class_room_theme.dart';
import '../data/course_data.dart';
import 'course_card_item.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class CourseItem extends StatelessWidget {
  final String courseTitle;
  final List<CourseData> courseList;

  const CourseItem({Key? key, required this.courseTitle, required this.courseList,}) : super(key: key);

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
                  mainAxisSize: MainAxisSize.min, // This makes the Row "shrink-wrapped" to its content
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
                child: Row(
                  children: courseList.map((courseData) {
                    return CourseCardItem(
                      courseTitle: courseData.title,
                      courseDescription: courseData.description,
                      courseImage: courseData.imagePath,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}