import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../../theme/app_theme.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/round_square_container.dart';
import '../item/foreign_invest_item.dart';
import '../item/internal_invest_item.dart';

final ThemeData theme = AppTheme.appTheme;

class HoldingItem extends StatefulWidget {
  const HoldingItem({Key? key}) : super(key: key);

  @override
  _HoldingState createState() => _HoldingState();
}

Container _internalWidget(BuildContext context) {
  Widget buildInternalItem(String image, String title, int totalprice,
      double percentage, int profit, int numOfItem) {
    return InternalInvestItem(
      image: image,
      title: title,
      totalprice: totalprice,
      percentage: percentage,
      profit: profit,
      numOfItem: numOfItem,
    );
  }

  return Container(
    padding: const EdgeInsets.all(10),
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return buildInternalItem("apple", "애플", 237816, 3.6, 478000, 21);
          case 1:
            return buildInternalItem("teslr", "테슬라", 331672, -1.1, 478000, 6);
          case 2:
            return buildInternalItem("ecopro", "에코프로", 1021000, 1.4, 478000, 6);
          case 3:
            return buildInternalItem("posco", "포스코DX", 60700, 3.2, 478000, 6);
          case 4:
            return buildInternalItem("sm", "에스엠", 132000, 1.3, 478000, 6);
          default:
            return SizedBox.shrink();
        }
      },
    ),
  );
}

Container _foreignWidget(BuildContext context) {
  Widget buildForeignItem(String image, String title, int totalprice,
      double percentage, int profit, int numOfItem) {
    return ForeignInvestItem(
      image: image,
      title: title,
      totalprice: totalprice,
      percentage: percentage,
      profit: profit,
      numOfItem: numOfItem,
    );
  }

  return Container(
    padding: const EdgeInsets.all(10),
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return buildForeignItem("apple", "애플", 237816, 3.6, 478000, 21);
          case 1:
            return buildForeignItem("teslr", "테슬라", 331672, -1.1, 478000, 6);
          case 2:
            return buildForeignItem("ecopro", "에코프로", 1021000, 1.4, 478000, 6);
          default:
            return SizedBox.shrink();
        }
      },
    ),
  );
}

Container _pieChart(BuildContext context){
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  List<Color> colorList = [
    Color(0xFFF25840),
    Color(0xFFFF7F50),
    Color(0xFFFED749),
    Color(0xFF1DE180),
    Color(0xFF89EAF3),
    Color(0xFF54B6FF),
    Color(0xFFA65CF4),
    Color(0xFFE19EC7),
    Color(0xFF465A65),
  ];

  return Container(
    child: Column(
      children: [
        SizedBox(height: 40,),
        PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartRadius: MediaQuery.of(context).size.width / 4,
          colorList: colorList,
          initialAngleInDegree: 0,
          chartType: ChartType.ring,
          ringStrokeWidth: 60,
          legendOptions: LegendOptions(
            showLegendsInRow: false,
            legendPosition: LegendPosition.bottom,
            showLegends: false,
            legendTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          chartValuesOptions: ChartValuesOptions(
            showChartValueBackground: false,
            showChartValues: false,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
          // gradientList: ---To add gradient colors---
          // emptyColorGradient: ---Empty Color gradient---
        ),
        SizedBox(height: 40,),
      ],
    ),
  );
}

Container _bodyWidget(BuildContext context){
  List<Color> colorList=[
    Color(0xFFF25840),
    Color(0xFFFF7F50),
    Color(0xFFFED749),
    Color(0xFF1DE180),
    Color(0xFF89EAF3),
    Color(0xFF54B6FF),
    Color(0xFFA65CF4),
    Color(0xFFE19EC7),
    Color(0xFF465A65),
  ];

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  List<String> keys = dataMap.keys.toList();
  List<double> values=dataMap.values.map<double>((value) => value as double).toList();
  double S = values.fold(0, (previousValue, element) => previousValue + element);

  return Container(
    color: theme.backgroundColor,
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top:20, left:20, right: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white
          ),
          child: Column(
            children: [
              Column(
                children: [
                  _pieChart(context),
                  //SizedBox(height: 40,),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: colorList[0],
                              ),
                              height: 10,
                              width: 10,
                              margin:EdgeInsets.all(10),
                            ),
                            Text(
                              keys[0],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              (values[0]/S*100).toInt().toString()+"%",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF575E6B),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: colorList[1],

                              ),
                              margin:EdgeInsets.all(10),
                            ),
                            Text(
                              keys[1],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              (values[1]/S*100).toInt().toString()+"%",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF575E6B),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: colorList[2],
                              ),
                              margin:EdgeInsets.all(10),
                            ),
                            Text(
                              keys[2],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              (values[2]/S*100).toInt().toString()+"%",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF575E6B),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: colorList[3],
                              ),
                              margin:EdgeInsets.all(10),
                            ),
                            Text(
                              keys[3],
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            Text(
                              (values[3]/S*100).toInt().toString()+"%",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF575E6B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //SizedBox(height: 40,),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _HoldingState extends State<HoldingItem>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,

    /// 탭 변경 애니메이션 시간
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: theme.backgroundColor,
        resizeToAvoidBottomInset : false,
        appBar: CustomAppBar(
          preferredHeight: 64,
          title: "보유종목",
          onSearchPressed: () {},
          showSearchIcon: true, // searchIcon 보이게
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            //color: theme.backgroundColor,
            child: Column(
              children: [
                _bodyWidget(context),
                Container(
                  color: theme.backgroundColor,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  constraints: BoxConstraints(minHeight: 500),
                  child: RoundSquareContainer(
                    width : MediaQuery.of(context).size.width,
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "보유주식 자산",
                               style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                                 color:Color(0xFF999999),
                               ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            child: Text(
                              "5,123,456원",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "+478,000원(7.5%)",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:Color(0xFFF6465D),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TabBar(
                              controller: tabController,
                              labelColor: Color(0xFF0ECB81),
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0ECB81),
                              ),
                              indicatorColor: Color(0xFF0ECB81),
                              unselectedLabelColor: Colors.grey,
                              unselectedLabelStyle: const TextStyle(
                                fontSize: 16,
                              ),
                              tabs: const [
                                Tab(text: "국내",),
                                Tab(text: "해외", ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  _internalWidget(context), // "국내" 탭에 _internalWidget를 배치
                                  // "해외" 탭의 내용을 추가
                                  _foreignWidget(context),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
