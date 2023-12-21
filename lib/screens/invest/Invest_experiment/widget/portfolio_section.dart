import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../widgets/round_square_container.dart';
import '../../portfolio.dart';

class PortfolioSection extends StatelessWidget {

  Widget _buildPortfolioHeader(ThemeData theme, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "포트폴리오 1",
            style: theme.textTheme.titleSmall,
          ),
          Container(
            width: 44,
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Portfolio()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: theme.cardColor,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "관리",
                style: TextStyle(
                  color: const Color(0xff575E6B),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioAmount() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "1,234,500 원",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = AppTheme.appTheme;

    return RoundSquareContainer(
      width: MediaQuery.of(context).size.width,
      height: 125,
      child: Column(
        children: [
          _buildPortfolioHeader(theme, context),
          _buildPortfolioAmount(),
        ],
      ),
    );
  }
}
