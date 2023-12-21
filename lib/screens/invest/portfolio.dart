import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stocodi_app/screens/invest/portfolio/widget/asset_section.dart';
import 'package:stocodi_app/screens/invest/portfolio/widget/portfolio_grid.dart';
import 'package:stocodi_app/screens/invest/portfolio/widget/portfolio_header.dart';
import '../../../../theme/app_theme.dart';
import '../../widgets/custom_appbar.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  _PortfolioState createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  double touchedValue = -1;

  bool showEarnings = true;
  ThemeData theme = AppTheme.appTheme;

  @override
  void initState() {
    touchedValue = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        // isSub: true,
        preferredHeight: 64,
        title: "포트폴리오",
        onSearchPressed: (){},
        showSearchIcon: false, // searchIcon 안 보이게
      ),
      body: SingleChildScrollView(
        primary: true, // 자식 위젯의 크기에 스크롤 높이 맞춰짐
        child: Container(
          color: theme.backgroundColor,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              PortfolioHeader(),
              AssetSection(showEarnings: showEarnings, touchedValue: touchedValue,),
              PortfolioGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
