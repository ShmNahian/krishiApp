import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseUploadPage extends StatefulWidget {
  const DiseaseUploadPage({super.key});

  @override
  State<DiseaseUploadPage> createState() => _DiseaseUploadPageState();
}

class _DiseaseUploadPageState extends State<DiseaseUploadPage> {
  File? image;
  bool isUploading = false;

  Future<void> pick() async {
    final picker = ImagePicker();
    final picked =
        await picker.pickImage(source: ImageSource.gallery, maxWidth: 1280);
    if (picked != null) {
      setState(() => image = File(picked.path));
    }
  }

  Future<void> mockUpload() async {
    if (image == null) return;
    setState(() => isUploading = true);
    await Future<void>.delayed(const Duration(seconds: 2));
    setState(() => isUploading = false);
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ডেমো ফলাফল'),
        content: const Text(
            'ছবি আপলোড সম্পন্ন। এআই ইন্টিগ্রেশন যুক্ত করে রোগ শনাক্ত করা যাবে।'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('ঠিক আছে'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('রোগযুক্ত পাতার ছবি আপলোড')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: image == null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.image_outlined,
                              size: 72, color: Colors.green),
                          SizedBox(height: 12),
                          Text('গ্যালারি থেকে একটি ছবি বাছাই করুন'),
                        ],
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(image!,
                            fit: BoxFit.cover, width: double.infinity),
                      ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton.icon(
                        onPressed: pick,
                        icon: const Icon(Icons.photo_library_outlined),
                        label: const Text('ছবি বাছাই করুন'))),
                const SizedBox(width: 12),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: isUploading ? null : mockUpload,
                    icon: isUploading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2))
                        : const Icon(Icons.cloud_upload_outlined),
                    label: const Text('এআই এ পাঠান'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
