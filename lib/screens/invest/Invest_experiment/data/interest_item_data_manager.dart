import 'interest_item_data.dart';

class InterestItemDataManager {
  static List<InterestItemData> investmentItems = [
    InterestItemData(image: "apple", title: "애플", price: 237816, changeValue:0.4, changePercentage: 3.6),
    InterestItemData(image: "teslr", title: "테슬라", price: 331672, changeValue:0.4, changePercentage: -1.1),
    InterestItemData(image: "ecopro", title: "에코프로", price: 1021000, changeValue:0.4, changePercentage: 1.4),
    InterestItemData(image: "posco", title: "포스코DX", price: 60700, changeValue:0.4, changePercentage: 3.2),
    InterestItemData(image: "sm", title: "에스엠", price: 132000, changeValue:0.4, changePercentage: 1.3),
  ];
}
