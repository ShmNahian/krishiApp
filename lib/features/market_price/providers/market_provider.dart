import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_market_repository.dart';
import '../domain/models/market_price.dart';

final marketRepositoryProvider =
    Provider<MockMarketRepository>((ref) => MockMarketRepository());
final marketPricesProvider = Provider<List<MarketPrice>>(
    (ref) => ref.watch(marketRepositoryProvider).getMarketPrices());
