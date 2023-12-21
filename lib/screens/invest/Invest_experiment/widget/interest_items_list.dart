import 'package:flutter/material.dart';
import 'package:stocodi_app/theme/app_theme.dart';
import '../../../../widgets/round_square_container.dart';
import '../../sell_buy.dart';
import '../../sellbuy/widget/stock_info.dart';
import '../data/interest_item_data.dart';
import '../item/interest_item.dart';

class InterestItemsList extends StatelessWidget {
  final ThemeData theme = AppTheme.appTheme;
  final List<InterestItemData> investmentItems;
  final BuildContext context;

  InterestItemsList({
    Key? key,
    required this.investmentItems,
    required this.context,
  }) : super(key: key);

  List<Widget> _buildInterestItems() {
    return investmentItems.map((item) {
      return InterestItem(
        image: item.image,
        title: item.title,
        price: item.price,
        percentage: item.changePercentage,
        // onPressed: (){},
        onPressed: () {
          // 클릭 시 SellBuy 페이지로 이동하고 해당 아이템 정보 전달
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SellBuy(
                stockInfo: StockInfo(
                  title: item.title,
                  price: item.price,
                  changeValue: item.changeValue,
                  changePercentage: item.changePercentage,
                ),
              ),
            ),
          );
        },
        heartOnPressed: (){},
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RoundSquareContainer(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "관심종목",
                textAlign: TextAlign.left,
                style: theme.textTheme.titleMedium,
              ),
            ),
            Expanded(
              child: ListView(
                children: _buildInterestItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
