import 'package:training_and_testing/models/models.dart';

class ProfileInfoModel {
  ProfileInfoModel({
    required this.name,
    required this.surname,
    required this.addresses,
    // required this.profileSettings,
    this.email,
    this.phone,
  });

  factory ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    return ProfileInfoModel(
      name: json['name'] as String,
      surname: json['surname'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      // profileSettings: ProfileSettingsModel.fromJson(
      //   json['profileSettings'] as Map<String, dynamic>,
      // ),
      addresses: List<AddressModel>.from(
        (json['addresses'] as List<dynamic>)
            .map((item) => AddressModel.fromJson(item as Map<String, dynamic>)),
      ),
    );
  }

  final String name;
  final String surname;
  final String? email;
  final String? phone;
  // final ProfileSettingsModel profileSettings;
  final List<AddressModel> addresses;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      // 'profileSettings': profileSettings.toJson(),
      'addresses': [addresses.map((e) => e.toJson())],
    };
  }

  @override
  String toString() {
    return <String>[
      'ProfileInfoModel(',
      'name: $name, ',
      'surname: $surname',
      'email: $email',
      // 'surname: $profileSettings',
      'email: $addresses)',
    ].join();
  }
}
