import 'package:stocodi_app/retrofit/HttpResult.dart';
import 'package:stocodi_app/web_socket/stock_service.dart';

final MyHttpResult _httpResult = MyHttpResult(); // MyHttpResult 인스턴스 생성

class StockManager {
  final StockService _apiService = StockService();

  Future<void> checkSocketConnection() async {
    try {
      // ApiService의 login 메서드 호출
      final response = await _apiService.checkSocketConnection();
      final responseData = response.data['response'];
      final accessToken = responseData['access_token'];
      final refreshToken = responseData['refresh_token'];
      await _apiService.storage.write(key: 'access_token', value: accessToken);
      await _apiService.storage.write(key: 'refresh_token', value: refreshToken);
      _httpResult.PrintResult(response, '소켓 연결 체크');

    } catch (e) {
      print('소켓 연결 체크 오류: $e');
    }
  }

  // Future<void> logOut() async{
  //   try {
  //     final response = await _apiService.logOut();
  //     _httpResult.PrintResult(response, '로그 아웃');
  //   } catch (e) {
  //     print('로그 아웃 오류: $e');
  //   }
  // }
  //
  // Future<void> nickNameExist(String nickname) async{
  //   try {
  //     final response = await _apiService.nickNameExist(nickname);
  //     _httpResult.PrintResult(response, '닉네임 중복');
  //   } catch (e) {
  //     print('닉네임 중복 체크 오류: $e');
  //   }
  // }
  //
  // Future<void> signUp(Register data) async{
  //   try {
  //     final response = await _apiService.signUp(data);
  //     _httpResult.PrintResult(response, '회원 가입');
  //   } catch (e) {
  //     print('회원가입 오류: $e');
  //   }
  // }
}
