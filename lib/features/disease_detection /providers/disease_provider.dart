import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_disease_repository.dart';
import '../domain/models/disease.dart';

final diseaseRepositoryProvider =
    Provider<MockDiseaseRepository>((ref) => MockDiseaseRepository());
final diseaseListProvider = Provider<List<Disease>>(
    (ref) => ref.watch(diseaseRepositoryProvider).getCommonDiseases());
