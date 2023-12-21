import 'package:flutter/material.dart';
import '../../../theme/class_room_theme.dart';
import '../lecture.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;
class CourseCardItem extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseImage;

  const CourseCardItem({
    Key? key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.5; // 80% of screen width
    double cardHeight = cardWidth * 0.8; // Maintain a 16:10 aspect ratio
    return GestureDetector(
      onTap: () {
        // CourseCard 클릭 시 VideoScreenActivity로 이동
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Lecture(),
          ),
        );
      },
      /*child: Container(
        width: cardWidth, height: cardHeight,
        margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽으로 정렬
          children: [
            Container(
              width: cardWidth, height: cardHeight * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(courseImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5), // 이미지와 텍스트 사이의 공간을 조절
            Text(courseTitle, style: textTheme.displayMedium, maxLines: 1, overflow: TextOverflow.ellipsis,),
            Text(courseDescription, style: textTheme.displaySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),*/
      child: IntrinsicHeight(
        child: Container(
          width: cardWidth,
          // height: cardHeight, 이 부분을 제거
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: cardWidth, height: cardHeight * 0.7,// 이 부분을 제거
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(courseImage),
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
      )
    );
  }
}
