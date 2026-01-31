import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseaseCapturePage extends StatefulWidget {
  const DiseaseCapturePage({super.key});

  @override
  State<DiseaseCapturePage> createState() => _DiseaseCapturePageState();
}

class _DiseaseCapturePageState extends State<DiseaseCapturePage> {
  File? image;
  bool isUploading = false;

  Future<void> capture() async {
    final picker = ImagePicker();
    final picked =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 1280);
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
        content:
            const Text('এআই বিশ্লেষণ সংযুক্ত করা হলে রোগের সম্ভাব্যতা দেখাবে।'),
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
      appBar: AppBar(title: const Text('রোগযুক্ত পাতার ছবি তুলুন')),
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
                          Icon(Icons.camera_alt, size: 72, color: Colors.green),
                          SizedBox(height: 12),
                          Text('ক্যামেরা খুলে পাতার ছবি তুলুন'),
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
                        onPressed: capture,
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text('ছবি তুলুন'))),
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
