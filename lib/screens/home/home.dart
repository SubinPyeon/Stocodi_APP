import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../widgets/portfolio_dialog.dart';
import 'homeitem.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late UpdatePortfolio updatePortfolio; // UpdatePortfolio 인스턴스 생성
  var f = NumberFormat('###,###,###,###');

  Map<String, int> price = {}; // price 맵 추가
  List<String> valueList = []; // valueList 추가
  var selectedValue = '우측 상단에서 계좌를 추가하세요.';
  var selectedPrice = 0;
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  List<Color> color = <Color>[];
  List<double> stops = <double>[];
  LinearGradient gradientColors = LinearGradient(colors: [], stops: []);

  @override
  void initState() {
    data = [
      _ChartData('CHN', 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14),
      _ChartData('a', 15),
      _ChartData('b', 15),
      _ChartData('c', 15),
      _ChartData('d', 15),
      _ChartData('e', 15),
      _ChartData('f', 15),
      _ChartData('g', 15),
    ];

    color.add(Color(0xFF0ECB81).withOpacity(0));
    color.add(Color(0xFF0ECB81).withOpacity(0.1));
    color.add(Color(0xFF0ECB81).withOpacity(0.3));

    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    gradientColors = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: color,
      stops: stops,
    );

    _tooltip = TooltipBehavior(enable: true);
    updatePortfolio = UpdatePortfolio(); // UpdatePortfolio 인스턴스 생성
    _loadPortfolioData();
    super.initState();
  }

  void _loadPortfolioData() async {
    await updatePortfolio.updatePortfolio();
    if (updatePortfolio.valueList.isNotEmpty) {
      setState(() {
        valueList = updatePortfolio.valueList.toSet().toList();
        selectedValue = valueList.first;
        price = updatePortfolio.price;
        selectedPrice = price[selectedValue] ?? 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
          if (ModalRoute.of(context)!.isCurrent) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            return true;
          }
          return false;
        },
        child: MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              // SingleChildScrollView 추가
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/app_background.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 60),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/stocodi.png',
                                    width: 150,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            builder: (context) {
                                              return PortfolioDialog();
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.add, // 플러스 아이콘
                                          size: 30, // 아이콘 크기
                                          color: Colors.white, // 아이콘 색상
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          //height: 120,
                          width: double.infinity,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Color(0xFF0ECB81),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 25, right: 25, left: 25),
                                child: DropdownButton(
                                  style: TextStyle(color: Colors.white),
                                  dropdownColor: Colors.black,
                                  elevation: 0,
                                  underline: SizedBox.shrink(),
                                  value: selectedValue,
                                  items: valueList.map(
                                    (value) {
                                      return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 16),
                                          ));
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedValue = value!;
                                      selectedPrice = price[value] ?? 0;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 25, left: 25),
                                child: Text(
                                  "${f.format(selectedPrice)}원",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 80, right: 25, left: 25, bottom: 12),
                                child: Container(
                                  width: double.infinity,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly, // 수평으로 공간을 고르게 분배
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // 텍스트를 왼쪽 정렬
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "수익률",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '수익금',
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly, // 수평으로 공간을 고르게 분배
                                            crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start, // 텍스트를 왼쪽 정렬
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  "+7.00%",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Color(0xFFF6465D),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  "+123,000원",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: Color(0xFFF6465D),
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ),
                                            ],
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
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 450,
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "수익률 통계",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            Image.asset('assets/images/next.png')
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 12),
                                child: Image.asset(
                                  'assets/images/stocodilogo.png',
                                  width: 24.58,
                                ),
                              ),
                              Text(
                                '초록증권 ',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text('123-2314-2341',
                                  style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                        //그래프자리
                        AspectRatio(
                          aspectRatio: 1.0 / 0.6,
                          child: SfCartesianChart(
                              enableAxisAnimation: true,
                              plotAreaBorderWidth: 0,
                              primaryXAxis: CategoryAxis(
                                majorGridLines: MajorGridLines(width: 0),
                                minorGridLines: MinorGridLines(width: 0),
                              ),
                              primaryYAxis: NumericAxis(
                                minimum: 0,
                                maximum: 30,
                                interval: 10,
                                majorGridLines: MajorGridLines(width: 0),
                                minorGridLines: MinorGridLines(width: 0),
                              ),
                              zoomPanBehavior: ZoomPanBehavior(
                                enablePanning: true,
                              ),
                              tooltipBehavior: _tooltip,
                              series: <ChartSeries<_ChartData, String>>[
                                AreaSeries<_ChartData, String>(
                                  borderColor: Color(0xFF0ECB81),
                                  borderWidth: 2,
                                  dataSource: data,
                                  xValueMapper: (_ChartData data, _) => data.x,
                                  yValueMapper: (_ChartData data, _) => data.y,
                                  gradient: gradientColors,
                                )
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 6),
                                child: Container(
                                  width: double.infinity,
                                  height: 56,
                                  padding: EdgeInsets.all(17),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Color(0xFFEDFFEF),
                                  ),
                                  child: Text(
                                    '포트폴리오 관리',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFF0ECB81)),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Container(
                                  width: double.infinity,
                                  height: 56,
                                  padding: EdgeInsets.all(17),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Color(0xFFEDFFEF),
                                  ),
                                  child: Text(
                                    '거래내역 보기',
                                    style: TextStyle(
                                        fontSize: 16, color: Color(0xFF0ECB81)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //강의목록
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
