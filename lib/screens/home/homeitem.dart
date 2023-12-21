

import '../../API/retrofit/auth_manager.dart';

class UpdatePortfolio {
  List<String> valueList = [];
  Map<String, int> price = {};

  Future<void> updatePortfolio() async {
    try {
      final authenticationManager = AuthenticationManager();

      var portfolioResponse = await authenticationManager.getPortfolio();
      if (portfolioResponse != null) {
        for (var response in portfolioResponse) {
          var account = response.account; // 자산 정보에 접근
          var histories = response.histories; // 거래 기록 목록에 접근
          var stockHoldings = response.stock_holdings; // 보유 종목 목록에 접근
          var stockHoldingRates =
              response.stock_holding_rates; // 보유 종목 등락 목록에 접근

          //각 AccountModel의 정보를 valueList에 추가
          valueList.add(account.account_name); //각 포트폴리오 계좌 이름
          price[account.account_name] = account.remain_cash;
        }

        print('Value 리스트 : $valueList');
        print('Price 맵 : $price');
      }
    } catch (e) {
      // 오류 처리
      print('오류 발생: $e');
    }
  }
}
