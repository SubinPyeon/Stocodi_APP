import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import 'package:stocodi_app/widgets/round_square_container.dart';
import '../data/portfolio_data.dart';

class PortfolioHeader extends StatefulWidget {
  PortfolioHeader({super.key});

  @override
  _PortfolioHeaderState createState() => _PortfolioHeaderState();
}

class _PortfolioHeaderState extends State<PortfolioHeader> {
  ThemeData theme = AppTheme.appTheme;

  late List<PortfolioData> portfolioList;
  late PortfolioData selectedPortfolio;

  @override
  void initState() {
    super.initState();

    // initState 내에서 초기화
    portfolioList = [
      PortfolioData("유의 포트폴리오_1", 10000000, 123000, 7.0),
      PortfolioData("유의 포트폴리오_2", 15000000, -20000, -1.0),
      PortfolioData("유의 포트폴리오_3", 8000000, 45000, 5.0),
    ];

    selectedPortfolio = portfolioList[0];
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormat = NumberFormat.currency(locale: 'ko_KR', symbol: ''); // 천의 단위로 ','로 구분

    return RoundSquareContainer(
      width: double.infinity,
      height: 160, // 원래 154
      child: Column(
        children: [
          Container(
            height: 22,
            alignment: Alignment.centerLeft,
            child: DropdownButton<PortfolioData>(
              underline: SizedBox.shrink(),
              value: selectedPortfolio, // 현재 선택된 포트폴리오
              items: portfolioList.map((PortfolioData portfolio) {
                return DropdownMenuItem<PortfolioData>(
                  value: portfolio,
                  child: Text(
                    portfolio.name,
                    style: theme.textTheme.titleSmall,
                  ),
                );
              }).toList(),
              onChanged: (PortfolioData? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedPortfolio = newValue;
                  });
                }
              },
            ),
          ),
          SizedBox(height: 28),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "${currencyFormat.format(selectedPortfolio.totalValue)} 원", // 자산 업데이트
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 32,
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              (selectedPortfolio.changeValue > 0 ? "+" : "") +
                  "${currencyFormat.format(selectedPortfolio.changeValue)}원 (${selectedPortfolio.changePercentage.toStringAsFixed(2)}%)", // 수익률 업데이트
              style: TextStyle(
                color: selectedPortfolio.changeValue >= 0 ? Color(0xffF6465D) : Color(0xff4496F7),
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}