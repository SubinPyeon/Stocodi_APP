import 'package:flutter/material.dart';
import 'course_data.dart';

List<String> images = List.generate(5, (index) => 'assets/kakao.jpg');

final unselected = Container(
  width: 6,
  height: 6,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(3),
    color: const Color(0xffd9d9d9),
  ),
);

final selected = Container(
  width: 18,
  height: 6,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(100),
    color: const Color(0xff0ecb81),
  ),
);

var excourse = CourseData(
  title: '주식, 1분만에 알려드림',
  description: 'Description of Course',
  imagePath: 'assets/kakao.jpg', // Replace with the actual image asset path
);
var courseList = [excourse, excourse, excourse];