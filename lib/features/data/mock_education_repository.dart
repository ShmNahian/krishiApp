import '../domain/models/learning_resource.dart';

class MockEducationRepository {
  List<LearningResource> getResources() {
    return [
      LearningResource(
          title: 'ধানের বালাই দমন কৌশল',
          type: 'article',
          link: 'https://dda.gov.bd'),
      LearningResource(
          title: 'স্মার্ট সেচ পদ্ধতি ভিডিও',
          type: 'video',
          link: 'https://youtube.com'),
      LearningResource(
          title: 'জৈব সার প্রস্তুত প্রণালী',
          type: 'article',
          link: 'https://krishi.gov.bd'),
    ];
  }
}
