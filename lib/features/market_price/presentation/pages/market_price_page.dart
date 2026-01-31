import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/market_provider.dart';

class MarketPricePage extends ConsumerWidget {
  const MarketPricePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prices = ref.watch(marketPricesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('বাজারদর পূর্বাভাস')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: prices.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = prices[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.cropName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(
                              'বর্তমান মূল্য: ${item.currentPrice.toStringAsFixed(0)} ${item.unit}'),
                        ],
                      ),
                      Chip(label: Text('ডেমো ট্রেন্ড')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 160,
                    child: LineChart(
                      LineChartData(
                        gridData: const FlGridData(show: false),
                        titlesData: const FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                        minY: item.trend.reduce((a, b) => a < b ? a : b) - 10,
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            color: Colors.green.shade600,
                            barWidth: 3,
                            dotData: const FlDotData(show: false),
                            spots: [
                              for (var i = 0; i < item.trend.length; i++)
                                FlSpot(i.toDouble(), item.trend[i].toDouble()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                      'এখানে বাস্তব বাজারদর API যুক্ত করে গ্রাফ আপডেট করা যাবে।',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
