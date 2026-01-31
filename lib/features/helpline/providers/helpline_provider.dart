import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/mock_helpline_repository.dart';
import '../domain/models/helpline_contact.dart';

final helplineRepositoryProvider =
    Provider<MockHelplineRepository>((ref) => MockHelplineRepository());
final helplineProvider = Provider<List<HelplineContact>>(
    (ref) => ref.watch(helplineRepositoryProvider).getContacts());
