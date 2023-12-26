import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;


// https://github.com/INVESTAR/StockAnalysisInPython


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StockReadNaver(),
    );
  }
}

class StockReadNaver extends StatefulWidget {
  const StockReadNaver({super.key});

  @override
  _StockReadNaverState createState() => _StockReadNaverState();
}

class _StockReadNaverState extends State<StockReadNaver> {
  String currentPrice = 'Loading...';
  String upAmount = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://finance.naver.com/item/main.naver?code=005930'); // 실제 URL로 바꾸세요.

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print('웹페이지 로드에 성공했습니다. 상태 코드: ${response.statusCode}');

        final document = htmlParser.parse(response.body);

        // 현재가
        final currentPriceElement = document.querySelector('.no_today');

        // 전일대비 상승량
        final upAmountElement = document.querySelector('.no_exday .no_up');

        setState(() {
          currentPrice = currentPriceElement.toString();
          upAmount = upAmountElement.toString();
        });
      } else {
        print('웹페이지를 가져오는데 실패했습니다. 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '현재가: $currentPrice',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              '전일대비 상승량: $upAmount',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
