import 'package:flutter/material.dart';
import '../Item/next_video_item.dart';

void main() {
  runApp(const LectureNextVideo());
}

class LectureNextVideo extends StatelessWidget {
  const LectureNextVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10, // 예시로 10개의 동영상을 표시
              itemBuilder: (context, index) {
                return VideoCard(
                  title: '동영상 제목 $index',
                  nickname: '유저 닉네임',
                  uploadDate: '2023-09-23',
                  views: '${index * 1000}회 조회',
                  thumbnailUrl:
                      'https://via.placeholder.com/150', // 썸네일 이미지 URL
                );
              },
            ),
            Positioned.fill(
              child: Container(
                color: Colors.grey.withOpacity(0.5),
                child: Center(
                  child: Text(
                    "현재 서비스 준비중입니다",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*AppBar(
          backgroundColor: Colors.white,
          title: Image.asset('assets/kakao.jpg', width: 100.0),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {
                // 검색 기능 추가
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.black),
              onPressed: () {
                // 계정 관련 기능 추가
              },
            ),
          ],
        ),*/