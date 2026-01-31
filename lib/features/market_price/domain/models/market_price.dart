class MarketPrice {
  MarketPrice(
      {required this.cropName,
      required this.currentPrice,
      required this.unit,
      required this.trend});

  final String cropName;
  final double currentPrice;
  final String unit;
  final List<double> trend;
}
