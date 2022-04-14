import 'dart:convert';

class Contacts {
  final String? email;
  final String? phone;
  final String? telegram;

  bool get hasPhone => phone != null && phone!.isNotEmpty;
  bool get hasEmail => email != null && email!.isNotEmpty;
  bool get hasTelegram => telegram != null && telegram!.isNotEmpty;

  Contacts({
    this.email,
    this.phone,
    this.telegram,
  });

  Contacts copyWith({
    String? email,
    String? phone,
    String? telegram,
  }) {
    return Contacts(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      telegram: telegram ?? this.telegram,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'phone': phone,
      'telegram': telegram,
    };
  }

  factory Contacts.fromMap(Map<String, dynamic> map) {
    return Contacts(
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      telegram: map['telegram'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Contacts.fromJson(String source) =>
      Contacts.fromMap(json.decode(source));

  @override
  String toString() =>
      'Contacts(email: $email, phone: $phone, telegram: $telegram)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contacts &&
        other.email == email &&
        other.phone == phone &&
        other.telegram == telegram;
  }

  @override
  int get hashCode => email.hashCode ^ phone.hashCode ^ telegram.hashCode;
}
