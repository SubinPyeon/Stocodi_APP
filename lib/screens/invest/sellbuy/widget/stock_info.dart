import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StockInfo extends StatelessWidget {
  final String title;
  final double price;
  final double changeValue;
  final double changePercentage;

  StockInfo({
    super.key,
    required this.title,
    required this.price,
    required this.changeValue,
    required this.changePercentage,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');

    return Container(
      padding: EdgeInsets.only(left: 14, bottom: 20),
      width: double.infinity,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min, // 내부 내용물의 크기에 따라 조절
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${currencyFormat.format(price)}원',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
            ),
            Text(
              (changeValue > 0 ? "+" : "") +
                    "${currencyFormat.format(changeValue)}원 (${changePercentage.toStringAsFixed(2)}%)",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: changeValue >= 0 ? Color(0xffF6465D) : Color(0xff4496F7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
