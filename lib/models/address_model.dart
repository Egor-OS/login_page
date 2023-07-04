class AddressModel {
  AddressModel({
    required this.id,
    required this.address,
    required this.city,
    required this.country,
    required this.name,
    required this.postcode,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'].toString(),
      address: json['address'].toString(),
      city: json['city'].toString(),
      country: json['country'].toString(),
      name: json['name'].toString(),
      postcode: json['postcode'].toString(),
    );
  }

  final String id;
  final String address;
  final String city;
  final String country;
  final String name;
  final String postcode;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'city': city,
      'country': country,
      'name': name,
      'postcode': postcode,
    };
  }

  @override
  String toString() {
    return <String>[
      'AddressModel(',
      'id : $id,',
      'address: $address,',
      'city : $city,',
      'country : $country,',
      'name : $name,',
      'postcode : $postcode)',
    ].join();
  }
}
