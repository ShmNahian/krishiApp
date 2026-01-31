import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_education_repository.dart';
import '../domain/models/learning_resource.dart';

final educationRepositoryProvider =
    Provider<MockEducationRepository>((ref) => MockEducationRepository());
final educationProvider = Provider<List<LearningResource>>(
    (ref) => ref.watch(educationRepositoryProvider).getResources());
