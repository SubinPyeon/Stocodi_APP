import 'package:flutter/material.dart';
import '../../../theme/lecture_video_theme.dart';

final theme = LectureVideoTheme.getAppTheme();
final textTheme = theme.textTheme;



class VideoDetails extends StatelessWidget {
  const VideoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 14, 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: Text(
              '초보 주식투자자들이 흔히 하는 실수 박곰희 1부',
              style: textTheme.displayLarge,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 17),
                child: Text(
                  '2023.05.25',
                  style: textTheme.displaySmall,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 23),
                child: Text(
                  '조회 2.8천회',
                  style: textTheme.displaySmall,
                ),
              ),
              Text(
                '더보기',
                style: textTheme.displaySmall,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(5, 20, 0, 0),
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/kakao.jpg'), // 이미지 파일의 경로를 적절히 수정하세요.
                    ),
                  ),
                ),
                Text(
                  '박곰희',
                  style: textTheme.displayMedium,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  height: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                        width: 86,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f7f9),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 6),
                                width: 24,
                                height: 24,
                                child: const Icon(Icons.favorite, color: Color(0xFF9BA6AF))
                            ),
                            Text(
                              '60K',
                              style: textTheme.labelSmall,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 8, 27, 8),
                        width: 96,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfff5f7f9),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(6, 2, 0, 2),
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 11),
                                width: 13,
                                height: 16,
                                child: const Icon(Icons.bookmark, color: Color(0xFF9BA6AF)),
                              ),
                              Text(
                                '스크랩',
                                style: textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 110,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xfff5f7f9),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 2, 0, 2),
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: const Icon(Icons.link, color: Color(0xFF9BA6AF))),
                        Text('링크 복사', style: textTheme.labelSmall,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(Icons.more_vert, color: Color(0xFF9BA6AF)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}