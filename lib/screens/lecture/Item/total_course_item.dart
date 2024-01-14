import 'package:flutter/material.dart';
import '../../../theme/class_room_theme.dart';
import '../lecture2.dart';

final theme = ClassRoomTheme.getAppTheme();
final textTheme = theme.textTheme;

class ClassRoomTotalItem extends StatelessWidget {
  final String courseTitle;
  final String courseDescription;
  final String courseAuthor;
  final int courseViews;
  final String courseImage;
  final String videoLink;
  final int lectureId;


  const ClassRoomTotalItem({
    Key? key,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseAuthor,
    required this.courseViews,
    required this.courseImage,
    required this.videoLink,
    required this.lectureId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width * 0.3;
    double cardHeight = cardWidth * 0.8;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Lecture2(courseCardItem: this,),
          ),
        );
      },
      child: IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 5, 10, 15),
          child: Row(
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
              SizedBox(width: 10,),
              Container(
                width: MediaQuery.of(context).size.width*0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: Text(courseTitle,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF191919),
                              ),
                              maxLines: 1, overflow: TextOverflow.ellipsis
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.bookmark_border, // 스크랩버튼
                          color: theme.primaryColor,
                          //스크랩여부 함수
                          //onPressed:
                        ),
                      ],
                    ),
                    Text(courseAuthor+" • 조회수 "+courseViews.toString()+"회",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF999999),
                        ),
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
