import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/disease_provider.dart';

class DiseaseListPage extends ConsumerWidget {
  const DiseaseListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diseases = ref.watch(diseaseListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('রোগ তালিকা')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: diseases.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = diseases[index];
          return Card(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16)),
                  child: Image.network(item.imageUrl,
                      height: 110, width: 110, fit: BoxFit.cover),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        Text(item.description,
                            maxLines: 3, overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
