import '../domain/models/advisory_tip.dart';

class MockAdvisoryRepository {
  List<AdvisoryTip> getAdvisories() {
    return [
      AdvisoryTip(
        title: 'আগামী ৩ দিনে হালকা বৃষ্টি',
        detail:
            'ধান ক্ষেতে পানি নিষ্কাশনের ব্যবস্থা রাখুন এবং গাছের গোড়ায় আগাছা পরিষ্কার করুন।',
        crop: 'ধান',
      ),
      AdvisoryTip(
        title: 'পোকা পর্যবেক্ষণ',
        detail:
            'ভুট্টার শীষে গুড়া পোকা দেখা দিলে ট্র্যাপ ব্যবহার করুন এবং প্রয়োজনে অনুমোদিত কীটনাশক স্প্রে করুন।',
        crop: 'ভুট্টা',
      ),
      AdvisoryTip(
        title: 'মাটি পরীক্ষার সুপারিশ',
        detail: 'রবি মৌসুমে সুষম সার প্রয়োগের জন্য মাটি পরীক্ষা করিয়ে নিন।',
        crop: 'সবজি',
      ),
    ];
  }
}
