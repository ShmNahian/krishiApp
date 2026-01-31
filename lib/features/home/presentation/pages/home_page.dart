import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:krishokbondhu/features/advisory/providers/advisory_provider.dart';
import 'package:krishokbondhu/features/market_price/providers/market_provider.dart';
import 'package:krishokbondhu/features/weather/providers/weather_provider.dart';
import 'package:krishokbondhu/shared/presentation/widgets/feature_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weather = ref.watch(todayWeatherProvider);
    final market = ref.watch(marketPricesProvider).first;
    final advisory = ref.watch(advisoryProvider).first;

    final features = [
      _Feature(
          title: 'রোগযুক্ত পাতার ছবি তুলুন',
          subtitle: 'ক্যামেরা খুলে ছবি তুলুন',
          icon: Icons.camera_alt_outlined,
          route: '/disease/capture'),
      _Feature(
          title: 'রোগযুক্ত পাতার ছবি আপলোড',
          subtitle: 'গ্যালারি থেকে বাছাই করুন',
          icon: Icons.upload_outlined,
          route: '/disease/upload'),
      _Feature(
          title: 'রোগ তালিকা',
          subtitle: 'সাধারণ রোগের তালিকা',
          icon: Icons.list_alt_outlined,
          route: '/disease/list'),
      _Feature(
          title: 'এআই সহায়তা',
          subtitle: 'চ্যাটবট সহায়তা',
          icon: Icons.smart_toy_outlined,
          route: '/assistant'),
      _Feature(
          title: 'স্মার্ট ফসল পরামর্শ',
          subtitle: 'এআই নির্ভর পরামর্শ',
          icon: Icons.tips_and_updates_outlined,
          route: '/advisory'),
      _Feature(
          title: 'আবহাওয়া আপডেট',
          subtitle: 'আজকের আবহাওয়া',
          icon: Icons.cloud_outlined,
          route: '/weather'),
      _Feature(
          title: 'বাজারদর পূর্বাভাস',
          subtitle: 'মূল্য প্রবণতা চার্ট',
          icon: Icons.show_chart_outlined,
          route: '/market'),
      _Feature(
          title: 'কৃষি অফিসারের নাম্বার সহায়',
          subtitle: 'হেল্পলাইন কল করুন',
          icon: Icons.call_outlined,
          route: '/helpline'),
      _Feature(
          title: 'কৃষি শিক্ষাকেন্দ্র',
          subtitle: 'আর্টিকেল ও ভিডিও',
          icon: Icons.school_outlined,
          route: '/education'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: const Icon(Icons.eco, color: Colors.green)),
            const SizedBox(width: 10),
            const Text('কৃষকবন্ধু',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _WelcomeCard(weatherText: weather.condition),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _InfoPill(
                      title: 'আজকের আবহাওয়া',
                      value: '${weather.temperatureC.toStringAsFixed(1)}°C',
                      subtitle:
                          'বৃষ্টি ${weather.rainChance.toStringAsFixed(0)}%',
                      icon: Icons.cloud_queue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _InfoPill(
                      title: 'বাজারদর',
                      value:
                          '${market.currentPrice.toStringAsFixed(0)} ${market.unit}',
                      subtitle: market.cropName,
                      icon: Icons.show_chart,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _InfoPill(
                      title: 'পরামর্শ',
                      value: advisory.crop,
                      subtitle: advisory.title,
                      icon: Icons.tips_and_updates,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text('ফিচারসমূহ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GridView.builder(
                itemCount: features.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final feature = features[index];
                  return FeatureCard(
                    title: feature.title,
                    subtitle: feature.subtitle,
                    icon: feature.icon,
                    background: Colors.white,
                    onTap: () => context.push(feature.route),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Feature {
  const _Feature(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.route});

  final String title;
  final String subtitle;
  final IconData icon;
  final String route;
}

class _WelcomeCard extends StatelessWidget {
  const _WelcomeCard({required this.weatherText});
  final String weatherText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.green.shade400, Colors.green.shade200]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('আপনাকে স্বাগতম, কৃষকবন্ধু',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('তোমার প্রতিদিনের চাষ একদিন তোমার ভাগ্য বদলে দেবে',
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Icon(Icons.emoji_nature, color: Colors.green.shade600),
              ),
              const SizedBox(height: 8),
              Text(weatherText, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill(
      {required this.title,
      required this.value,
      required this.subtitle,
      required this.icon});

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: Colors.green.shade50,
              child: Icon(icon, color: Colors.green.shade700)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.black54)),
                Text(value,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
