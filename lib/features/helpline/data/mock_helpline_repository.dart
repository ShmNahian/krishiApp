import '../domain/models/helpline_contact.dart';

class MockHelplineRepository {
  List<HelplineContact> getContacts() {
    return [
      HelplineContact(
          name: 'উপজেলা কৃষি অফিসার',
          phone: '+8801711001100',
          region: 'মাদারীপুর'),
      HelplineContact(
          name: 'কৃষি এক্সটেনশন অফিসার',
          phone: '+8801711002200',
          region: 'কুমিল্লা'),
      HelplineContact(name: 'কৃষি হটলাইন', phone: '16123', region: 'জাতীয়'),
    ];
  }
}
