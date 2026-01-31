import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/education_provider.dart';

class EducationPage extends ConsumerWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resources = ref.watch(educationProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('কৃষি শিক্ষাকেন্দ্র')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: resources.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final res = resources[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: res.type == 'video'
                    ? Colors.red.shade100
                    : Colors.blue.shade100,
                child: Icon(
                    res.type == 'video' ? Icons.play_circle : Icons.article,
                    color: Colors.black87),
              ),
              title: Text(res.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(res.type == 'video' ? 'ভিডিও' : 'প্রবন্ধ'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('লিংক খোলা হবে: ${res.link}'))),
            ),
          );
        },
      ),
    );
  }
}
