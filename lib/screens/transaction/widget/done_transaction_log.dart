import 'package:flutter/material.dart';
import '../item/done_transaction_item.dart';

class DoneTransactionLog extends StatelessWidget {
  const DoneTransactionLog({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 13,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 스크롤을 막음
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return DoneItem(
                    perPrice: 240000,
                    stock: "애플",
                    day: "9월 11일",
                    buy: 1,
                    howmuch: 7,
                  );
                } else if (index == 1) {
                  return DoneItem(
                    perPrice: 330000,
                    stock: "테슬라",
                    day: "9월 10일",
                    buy: 1,
                    howmuch: 10,
                  );
                } else if (index == 2) {
                  return DoneItem(
                    perPrice: 1021000,
                    stock: "에코프로",
                    day: "9월 9일",
                    buy: 0,
                    howmuch: 1,
                  );
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
