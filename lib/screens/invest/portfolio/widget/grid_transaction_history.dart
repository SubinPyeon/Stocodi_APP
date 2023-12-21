import 'package:flutter/material.dart';
import '../../../../theme/app_theme.dart';

class GridTransactionHistory extends StatelessWidget {
  final int reservation, thisMonth;
  ThemeData theme = AppTheme.appTheme;

  GridTransactionHistory({
    required this.reservation,
    required this.thisMonth,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder:  (context, constraints) {
        double containerWidth = constraints.maxWidth;
        double arrowWidth = containerWidth * 0.17;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                        "거래내역",
                        style: theme.textTheme.titleMedium,
                    )
                ),
                Container(
                  width: arrowWidth,
                  height: arrowWidth,
                  child: Image.asset('assets/images/arrow.png', color: theme.primaryColor,),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: containerWidth,
                  height: containerWidth*(30/124),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Text(
                              "예약",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                          )
                      ),
                      Container(
                          child: Text(
                              "${reservation}건",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  width: containerWidth,
                  height: containerWidth*(30/124),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Text(
                              "이번달",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                          )
                      ),
                      SizedBox(height: 8),
                      Container(
                          child: Text(
                              "${thisMonth}건",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                          )
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ],
        );
      }
    );
  }
}
