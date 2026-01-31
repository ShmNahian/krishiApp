import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(todayWeatherProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('আবহাওয়া আপডেট')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${weather.temperatureC.toStringAsFixed(1)}°C',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(weather.condition,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                            'বৃষ্টির সম্ভাবনা ${weather.rainChance.toStringAsFixed(0)}%'),
                      ],
                    ),
                    Icon(Icons.cloud_outlined,
                        size: 56, color: Colors.green.shade600),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('পরবর্তী ফিচার',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
                'এখানে বাস্তব আবহাওয়ার API যুক্ত করে ঘণ্টাওয়ারি ও ৭ দিনের পূর্বাভাস দেখানো যাবে।'),
          ],
        ),
      ),
    );
  }
}
