import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/helpline_provider.dart';

class HelplinePage extends ConsumerWidget {
  const HelplinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(helplineProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('কৃষি অফিসারের নাম্বার সহায়')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            child: ListTile(
              title: Text(contact.name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(contact.region),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.call, color: Colors.green),
                  const SizedBox(height: 4),
                  Text(contact.phone),
                ],
              ),
              onTap: () {
                // Placeholder for call action
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('কল করা হচ্ছে: ${contact.phone}')));
              },
            ),
          );
        },
      ),
    );
  }
}
