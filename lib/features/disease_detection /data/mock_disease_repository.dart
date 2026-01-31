import '../domain/models/disease.dart';

class MockDiseaseRepository {
  List<Disease> getCommonDiseases() {
    return [
      Disease(
        name: 'ব্লাস্ট রোগ',
        description: 'ধানের পাতায় বাদামী দাগ তৈরি হয় যা দ্রুত ছড়ায়।',
        imageUrl:
            'https://images.unsplash.com/photo-1501004318641-b39e6451bec6',
      ),
      Disease(
        name: 'পাতায় পোড়া',
        description: 'পাতার কিনারা শুকিয়ে যায় এবং গাছে দুর্বলতা আসে।',
        imageUrl:
            'https://images.unsplash.com/photo-1501004318641-b39e6451bec6',
      ),
      Disease(
        name: 'ডাউনি মিলডিউ',
        description: 'ভুট্টায় সাদা ফুসকুড়ি ও পাতার উল্টোদিকে মলিনতা।',
        imageUrl:
            'https://images.unsplash.com/photo-1501004318641-b39e6451bec6',
      ),
    ];
  }
}
