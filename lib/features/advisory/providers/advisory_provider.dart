import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_advisory_repository.dart';
import '../domain/models/advisory_tip.dart';

final advisoryRepositoryProvider =
    Provider<MockAdvisoryRepository>((ref) => MockAdvisoryRepository());
final advisoryProvider = Provider<List<AdvisoryTip>>(
    (ref) => ref.watch(advisoryRepositoryProvider).getAdvisories());
