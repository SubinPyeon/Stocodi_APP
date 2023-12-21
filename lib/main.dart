import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:stocodi_app/screens/app.dart';
import 'package:stocodi_app/screens/sign_up/signup.dart';
import 'package:stocodi_app/screens/sign_up/splash_screen.dart';
import 'API/retrofit/auth_manager.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final authenticationManager = AuthenticationManager();

  Future<void> autoLogin(BuildContext context) async {
    try {
      var storedAccessToken =
          await authenticationManager.getToken("access_token");

      // 저장된 토큰이 있으면 자동 로그인 시도
      final success = await authenticationManager.newToken();

      if (success) {
        // 자동 로그인 성공하면 2초 지연 후 AppScreen으로 이동
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AppScreen(),
          ),
        );
      } else {
        // 토큰이 없으면 2초 지연 후 Signup 페이지로 이동
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Signup(),
          ),
        );
      }
    } catch (e) {
      // 오류 처리
      // 토큰이 없거나 자동 로그인 실패할 경우 2초 지연 후 Signup 페이지로 이동
      await Future.delayed(const Duration(seconds: 2));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Signup(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => FutureBuilder(
          future: autoLogin(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: _splashLoadingWidget(snapshot),
              );
            } else {
              // 여기서 로딩 중인 상태에 해당하는 위젯을 반환할 수 있습니다.
              return const Splash_Screen();
            }
          },
        ),
      ),
    );
  }

  Widget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      return const Scaffold(
        body: Center(
          child: Text("Error!!"),
        ),
      );
    } else {
      // 여기에 로딩 완료 후에 보여줄 위젯을 반환할 수 있습니다.
      return Container();
    }
  }
}
