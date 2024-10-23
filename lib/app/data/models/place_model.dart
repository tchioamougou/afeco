class PlaceModel {
  final int? placeId;
  final String? licence;
  final String? osmType;
  final int? osmId;
  final String? lat;
  final String? lon;
  final String? classType;
  final String? type;
  final int? placeRank;
  final double? importance;
  final String? addresstype;
  final String? name;
  final String? displayName;
  final Address? address;
   int? distance;
  PlaceModel({
    this.placeId,
    this.licence,
    this.osmType,
    this.osmId,
    this.lat,
    this.lon,
    this.classType,
    this.type,
    this.placeRank,
    this.importance,
    this.addresstype,
    this.name,
    this.displayName,
    this.address,
    this.distance,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    placeId: json['place_id'] as int?,
    licence: json['licence'] as String?,
    osmType: json['osm_type'] as String?,
    osmId: json['osm_id'] as int?,
    lat: json['lat']as String ?,
    lon: json['lon'] as String ?,
    classType: json['class'] as String?,
    type: json['type'] as String?,
    placeRank: json['place_rank'] as int?,
    importance: json['importance'] as double?,
    addresstype: json['addresstype'] as String?,
    name: json['name'] as String?,
    displayName: json['display_name'] as String?,
    address: json['address'] != null ? Address.fromJson(json['address'] as Map<String, dynamic>) : null,
      distance:json['distance']??0
  );

  Map<String, dynamic> toJson() => {
    'place_id': placeId,
    'licence': licence,
    'osm_type': osmType,
    'osm_id': osmId,
    'lat': lat,
    'lon': lon,
    'class': classType,
    'type': type,
    'place_rank': placeRank,
    'importance': importance,
    'addresstype': addresstype,
    'name': name,
    'display_name': displayName,
    'address': address?.toJson(),
    'distance':distance
  };
}

class Address {
  final String? amenity;
  final String? houseNumber;
  final String? road;
  final String? neighbourhood;
  final String? city;
  final String? stateDistrict;
  final String? state;
  final String? iso31662Lvl4;
  final String? postcode;
  final String? country;
  final String? countryCode;

  Address({
    this.amenity,
    this.houseNumber,
    this.road,
    this.neighbourhood,
    this.city,
    this.stateDistrict,
    this.state,
    this.iso31662Lvl4,
    this.postcode,
    this.country,
    this.countryCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    amenity: json['amenity'] as String?,
    houseNumber: json['house_number'] as String?,
    road: json['road'] as String?,
    neighbourhood: json['neighbourhood'] as String?,
    city: json['city'] as String?,
    stateDistrict: json['state_district'] as String?,
    state: json['state'] as String?,
    iso31662Lvl4: json['ISO3166-2-lvl4'] as String?,
    postcode: json['postcode'] as String?,
    country: json['country'] as String?,
    countryCode: json['country_code'] as String?,
  );

  Map<String, dynamic> toJson() => {
  'amenity': amenity,
  'house_number': houseNumber,
  'road': road,
  'neighbourhood': neighbourhood,
  'city': city,
  'state_district': stateDistrict,
  'state': state,
  'ISO3166-2-lvl4': iso31662Lvl4,
  'postcode': postcode,
    'country': country,
    'country_code': countryCode,
  };
}