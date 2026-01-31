import '../domain/models/market_price.dart';

class MockMarketRepository {
  List<MarketPrice> getMarketPrices() {
    return [
      MarketPrice(
          cropName: 'ধান',
          currentPrice: 1250,
          unit: 'টাকা/মণ',
          trend: [1100, 1180, 1200, 1230, 1250]),
      MarketPrice(
          cropName: 'গম',
          currentPrice: 980,
          unit: 'টাকা/মণ',
          trend: [900, 940, 960, 970, 980]),
      MarketPrice(
          cropName: 'পেঁয়াজ',
          currentPrice: 72,
          unit: 'টাকা/কেজি',
          trend: [60, 64, 68, 70, 72]),
    ];
  }
}
