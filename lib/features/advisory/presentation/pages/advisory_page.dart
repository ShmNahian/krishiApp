import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/advisory_provider.dart';

class AdvisoryPage extends ConsumerWidget {
  const AdvisoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final advisories = ref.watch(advisoryProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('স্মার্ট ফসল পরামর্শ')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: advisories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final tip = advisories[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(tip.crop,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.green.shade700)),
                      const Icon(Icons.lightbulb_outline, color: Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(tip.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(tip.detail),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
