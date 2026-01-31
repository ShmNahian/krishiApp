import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagesProvider = StateProvider<List<_ChatMessage>>(
  (ref) => const [
    _ChatMessage(
      sender: 'assistant',
      text: 'হ্যালো! আজ কীভাবে সহায়তা করতে পারি?',
    ),
  ],
);

class AssistantPage extends ConsumerWidget {
  const AssistantPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final messages = ref.watch(messagesProvider);

    void send() {
      final text = controller.text.trim();
      if (text.isEmpty) return;
      ref.read(messagesProvider.notifier).state = [
        ...messages,
        _ChatMessage(sender: 'user', text: text),
        _ChatMessage(
          sender: 'assistant',
          text: 'এই মুহূর্তে ডেমো মোডে আছি। আপনার প্রশ্নটি লিপিবদ্ধ করা হলো।',
        ),
      ];
      controller.clear();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('এআই সহায়তা')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final message = messages[index];
                  final isUser = message.sender == 'user';
                  return Align(
                    alignment: isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isUser ? Colors.green.shade100 : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      child: Text(message.text),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'বার্তা লিখুন...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                      ),
                      onSubmitted: (_) => send(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton.icon(
                    onPressed: send,
                    icon: const Icon(Icons.send),
                    label: const Text('পাঠান'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessage {
  const _ChatMessage({required this.sender, required this.text});
  final String sender;
  final String text;
}
