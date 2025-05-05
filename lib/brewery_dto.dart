import 'package:equatable/equatable.dart';

class BreweryDto extends Equatable {
  final String? id;
  final String? name;
  final String? breweryType;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? city;
  final String? stateProvince;
  final String? postalCode;
  final String? country;
  final double? longitude;
  final double? latitude;
  final String? phone;
  final String? websiteUrl;
  final String? state;
  final String? street;

  const BreweryDto({
    this.id,
    this.name,
    this.breweryType,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.stateProvince,
    this.postalCode,
    this.country,
    this.longitude,
    this.latitude,
    this.phone,
    this.websiteUrl,
    this.state,
    this.street,
  });

  factory BreweryDto.fromJson(Map<String, dynamic> json) {
    return BreweryDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      breweryType: json['brewery_type'] as String?,
      address1: json['address_1'] as String?,
      address2: json['address_2'] as String?,
      address3: json['address_3'] as String?,
      city: json['city'] as String?,
      stateProvince: json['state_province'] as String?,
      postalCode: json['postal_code'] as String?,
      country: json['country'] as String?,
      longitude: json['longitude'] as double?,
      latitude: json['latitude'] as double?,
      phone: json['phone'] as String?,
      websiteUrl: json['website_url'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brewery_type': breweryType,
      'address_1': address1,
      'address_2': address2,
      'address_3': address3,
      'city': city,
      'state_province': stateProvince,
      'postal_code': postalCode,
      'country': country,
      'longitude': longitude,
      'latitude': latitude,
      'phone': phone,
      'website_url': websiteUrl,
      'state': state,
      'street': street,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        breweryType,
        address1,
        address2,
        address3,
        city,
        stateProvince,
        postalCode,
        country,
        longitude,
        latitude,
        phone,
        websiteUrl,
        state,
        street,
      ];
}
