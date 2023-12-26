import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Price',
      home: StockPriceScreen(),
    );
  }
}

class StockPriceScreen extends StatefulWidget {
  @override
  _StockPriceScreenState createState() => _StockPriceScreenState();
}

class _StockPriceScreenState extends State<StockPriceScreen> {
  String stockPrice = 'Loading...';

  @override
  void initState() {
    super.initState();
    fetchStockPrice();
  }

  Future<void> fetchStockPrice() async {
    final url = Uri.parse('https://www.google.com/finance/quote/005930:KRX'); // 삼성전자(KRX: 005930)의 Google Finance 페이지 URL

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final document = htmlParser.parse(response.body);

        // 현재 주식 가격을 가져오기 위한 선택자 (변경 가능)
        final priceElement = document.querySelector('.YMlKec.fxKbKc');
        final price = priceElement?.text ?? 'Not found';

        setState(() {
          stockPrice = price;
        });
      } else {
        print('Failed to load webpage. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Price'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '삼성전자 현재 주식 가격:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              stockPrice,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
