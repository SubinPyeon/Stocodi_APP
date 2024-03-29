import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class RealtimePopularity extends StatelessWidget {
  List<String> TitleList = [
    "검색어1",
    "검색어2",
    "검색어20",
    "검색어12445",
    "검색어1205",
    "검색어88",
    "검색어1",
    "검색어2",
    "검색어20",
    "검색어12445",
  ];

  RealtimePopularity({super.key});

  //텍스트박스
  Container textContainer(String text, String number) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Container(
            width: 23,
            child: Text(
              number,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff0ECB81),
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          width: screenWidth,
          padding: EdgeInsets.only(top: 30, right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "실시간 인기",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //왼
                  SizedBox(
                    width: (screenWidth - 50) / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textContainer(TitleList[0], "1"),
                        textContainer(TitleList[1], "2"),
                        textContainer(TitleList[2], "3"),
                        textContainer(TitleList[3], "4"),
                        textContainer(TitleList[4], "5"),
                      ],
                    ),
                  ),
                  //오
                  SizedBox(
                    width: (screenWidth - 50) / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textContainer(TitleList[5], "6"),
                        textContainer(TitleList[6], "7"),
                        textContainer(TitleList[7], "8"),
                        textContainer(TitleList[8], "9"),
                        textContainer(TitleList[9], "10"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
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
    );
  }
}