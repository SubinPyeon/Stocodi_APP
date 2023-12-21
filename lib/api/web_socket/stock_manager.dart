import 'package:dio/src/response.dart' as dioResponse;
import 'package:http/http.dart';
import 'package:stocodi_app/API/web_socket/stock_service.dart';
import 'package:stocodi_app/api/web_socket/stock_http_result.dart';
import 'package:stocodi_app/model/stock/response/stock_list.dart';
import '../../model/stock/request/change_stock.dart';
import '../../model/stock/request/interest_stock.dart';
import '../../model/stock/response/stock.dart';

final MyHttpResult _httpResult = MyHttpResult(); // MyHttpResult 인스턴스 생성

class StockManager {
  final StockService stockService = StockService();

  // 소켓 연결 체크
  Future<dioResponse.Response?> checkSocketConnection() async {
    try {
      // ApiService의 checkSocketConnection 메서드 호출
      final response = await stockService.checkSocketConnection();
      _httpResult.PrintResult(response, '소켓 연결 체크');
      return response;
    } catch (e) {
      print('소켓 연결 체크 오류: $e');
    }
    return null;
  }

  // 실시간 주식 변경
  Future<void> changeStock(ChangeStock data) async {
    try {
      final response = await stockService.changeStock(data);
      _httpResult.PrintResult(response, '실시간 주식 변경');
    } catch (e) {
      print('실시간 주식 변경 오류: $e');
    }
  }

  // 관심 종목 등록
  Future<void> registerInterestStock(InterestStock data) async {
    try {
      final response = await stockService.registerInterestStock(data);
      _httpResult.PrintResult(response, '관심 종목 등록');
    } catch (e) {
      print('관심 종목 등록 오류: $e');
    }
  }

  // 관심 종목 실시간 거래량 순위 Best 5
  Future<void> getBest5InterestStock(String email) async {
    try {
      final response = await stockService.getBest5InterestStock(email);
      _httpResult.PrintResult(response, '관심 종목 실시간 거래량 순위 Best 5');
    } catch (e) {
      print('관심 종목 실시간 거래량 순위 Best 5 오류: $e');
    }
  }

  // 종목 차트 정보 조회
  Future<void> getStockChartInfo(String code) async {
    try {
      final response = await stockService.getStockChartInfo(code);
      _httpResult.PrintResult(response, '종목 차트 정보 조회');
    } catch (e) {
      print('종목 차트 정보 조회 오류: $e');
    }
  }

  // 실시간 거래량 순위 Best 5
  Future<void> getBest5Stock() async {
    try {
      final response = await stockService.getBest5Stock();
      _httpResult.PrintResult(response, '실시간 거래량 순위 Best 5');
    } catch (e) {
      print('실시간 거래량 순위 Best 5 오류: $e');
    }
  }

  // 종목 검색
  Future<List<Stock>?> getStockInfo(String key) async {
    try {
      final response = await stockService.getStockInfo(key);
      _httpResult.PrintResult(response, '종목 검색');

      // print("response : " + response.toString());
      // print(
          // "response.data[response] : " + response.data['response'].toString());
      // print("response.data[response][stock_list] : " +
      //     response.data['response']['stock_list'].toString());

      List<Stock> stockResponse = (response
          .data['response']['stock_list'] as List).map((json) =>
          Stock.fromJson(json)).toList();
      return stockResponse;

      // if (response.data['response']['stock_list'] != null) {
      //   // print("stock_list 출력"+response.data['response']['stock_list'].toString());
      //   return StockList.fromJson(response.data['response']['stock_list']);
      // }
      // return null;
    } catch (e) {
      print('종목 검색 오류: $e');
      return null;
    }
  }
}
