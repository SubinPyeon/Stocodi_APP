import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/transaction_theme.dart';
import 'package:stocodi_app/widgets/custom_appbar.dart';
import '../transaction_info.dart';

void main() {
  runApp(const TransactionMain());
}

final theme = TransactionTheme.appTheme;

class TransactionMain extends StatefulWidget {
  const TransactionMain({Key? key}) : super(key: key);

  @override
  _TransactionMainState createState() => _TransactionMainState();
}

class _TransactionMainState extends State<TransactionMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
          // isSub: true,
          preferredHeight: 64,
          title: "거래내역",
          onSearchPressed: () {},
          showSearchIcon: false, // searchIcon 안 보이게
        ),
        body: Container(
          color: Color(0xffF5F5F5),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                  ),
                  child: TransactionInfo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
