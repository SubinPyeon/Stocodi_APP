import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../theme/app_theme.dart';


class InterestItem extends StatelessWidget {
  ThemeData theme = AppTheme.appTheme;

  final String image;
  final String title;
  final double price;
  final double percentage;
  final VoidCallback onPressed;
  final VoidCallback heartOnPressed;

  InterestItem({
    required this.image,
    required this.title,
    required this.price,
    required this.percentage,
    required this.onPressed,
    required this.heartOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat('###,###,###,###');

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(bottom: 30,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: Image.asset('assets/images/${image}.png', fit: BoxFit.fill,).image,
              radius: 20, // 동그란 이미지 크기 설정
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall,
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      "${format.format(price)}원",
                      style: TextStyle(height: 1, fontSize: 14),
                    ),
                    SizedBox(width: 4),
                    Text(
                      (percentage > 0 ? "+" : "") + "${(percentage)}%",
                      style: TextStyle(
                        height: 1,
                        fontSize: 14,
                        color: percentage > 0 ? Color(0xffF6465D) : Color(0xff4496F7),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.favorite), // 하트 버튼
              color: theme.primaryColor,
              onPressed: heartOnPressed,
            ),
          ],
        ),
      ),
    );
  }
}
