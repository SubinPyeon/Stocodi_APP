import 'package:stocodi_app/retrofit/HttpDTO/request/auth/login_model.dart';
import 'package:stocodi_app/retrofit/httpdto/request/auth/members_model.dart';
import 'package:stocodi_app/retrofit/httpdto/request/transactions/accounts_model.dart';
import 'package:stocodi_app/retrofit/httpdto/request/transactions/purchases_model.dart';

final signupData = MembersRequest(
  email: 'oz9911@naver.com', password: '1234', name: '김동기', nickname: 'oz', gender: 'MALE', interest_categories: ["IT"], birth_date: "2000-01-11",
);

final loginData = LoginRequest(
    email: 'oz9911@naver.com', password: '1234'
);
final portfolioData = PortfolioRequest(account_name: '계좌', initial_cash: 10000);
//final stockdata = PurchasesRequest(account_name: '', stock_name: '', price: null, quantity: null);