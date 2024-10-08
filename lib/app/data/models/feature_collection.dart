
class Location {
  final String datasourceSourcename;
  final String datasourceAttribution;
  final String datasourceLicense;
  final String datasourceUrl;

  final String country;
  final String countryCode;
  final String state;
  final String county;
  final String city;
  final String? district; // Optional since some locations might not have a district
  final double lon;
  final double lat;
  final String stateCode;
  final String resultType;
  final String formatted;
  final String addressLine1;
  final String addressLine2;
  final String category;

  final Timezone timezone;
  final String plusCode;

  final Rank rank;
  final String placeId;


  Location({
    required this.datasourceSourcename,
    required this.datasourceAttribution,
    required this.datasourceLicense,
    required this.datasourceUrl,
    required this.country,
    required this.countryCode,
    required this.state,
    required this.county,
    required this.city,
    this.district,
    required this.lon,
    required this.lat,
    required this.stateCode,
    required this.resultType,
    required this.formatted,
    required this.addressLine1,
    required this.addressLine2,
    required this.category,
    required this.timezone,
    required this.plusCode,
    required this.rank,
    required this.placeId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    datasourceSourcename: json['datasource']['sourcename'],
    datasourceAttribution: json['datasource']['attribution'],
    datasourceLicense: json['datasource']['license'],
    datasourceUrl: json['datasource']['url'],
    country: json['country'],
    countryCode: json['country_code'],
    state: json['state'],
    county: json['county'],
    city: json['city'],
    //district: json['properties'].containsKey('district') ? json['properties']['district'] : null,
    lon: json['lon'].toDouble(),
    lat: json['lat'].toDouble(),
    stateCode: json['state_code'],
    resultType: json['result_type'],
    formatted: json['formatted'],
    addressLine1: json['address_line1'],
    addressLine2: json['address_line2'],
    category: json['category'],
    timezone: Timezone.fromJson(json['timezone']),
    plusCode: json['plus_code'],
    rank: Rank.fromJson(json['rank']),
    placeId: json['place_id'],);

  Map<String, dynamic> toJson() => {
    'datasource': {
      'sourcename': datasourceSourcename,
      'attribution': datasourceAttribution,
      'license': datasourceLicense,
      'url': datasourceUrl,
    },
    'country': country,
    'country_code': countryCode,
    'state': state,
    'county': county,
    'city': city,
    if (district != null) 'district': district,
    'lon': lon,
    'lat': lat,
    'state_code': stateCode,
    'result_type': resultType,
    'formatted': formatted,
    'address_line1': addressLine1,
    'address_line2': addressLine2,
    'category': category,
    'timezone': timezone.toJson(),
    'plus_code': plusCode,
    'rank': rank.toJson(),
    'place_id': placeId,
  };
}
class Timezone {
  final String name;
  final String nameAlt;
  final String  offsetStd;
  final int offsetStdSeconds;
  final String offsetDst;
  final int offsetDstSeconds;
  final String abbreviationStd;
  final String abbreviationDst;

  Timezone({
    required this.name,
    required this.nameAlt,
    required this.offsetStd,
    required this.offsetStdSeconds,
    required this.offsetDst,
    required this.offsetDstSeconds,
    required this.abbreviationStd,
    required this.abbreviationDst,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    name: json['name'],
    nameAlt: json['name_alt'],
    offsetStd: json['offset_STD'],
    offsetStdSeconds: json['offset_STD_seconds'],
    offsetDst: json['offset_DST'],
    offsetDstSeconds: json['offset_DST_seconds'],
    abbreviationStd: json['abbreviation_STD'],
    abbreviationDst: json['abbreviation_DST'],
  );

  Map<String, dynamic> toJson() 
  => {
  'name': name,
  'name_alt': nameAlt,
  'offset_STD': offsetStd,
  'offset_STD_seconds': offsetStdSeconds,
  'offset_DST': offsetDst,
  'offset_DST_seconds': offsetDstSeconds,
  'abbreviation_STD': abbreviationStd,
  'abbreviation_DST': abbreviationDst,
  };
}

class Rank {
  final double importance;
  final int confidence;
  final int confidenceCityLevel;
  final String matchType;

  Rank({
    required this.importance,
    required this.confidence,
    required this.confidenceCityLevel,
    required this.matchType,
  });

  factory Rank.fromJson(Map<String, dynamic> json) => Rank(
    importance: json['importance'].toDouble(),
    confidence: json['confidence'],
    confidenceCityLevel: json['confidence_city_level'],
    matchType: json['match_type'],
  );

  Map<String, dynamic> toJson() => {
    'importance': importance,
    'confidence': confidence,
    'confidence_city_level': confidenceCityLevel,
    'match_type': matchType,
  };
}

class Feature {
  final String type;
  final Location properties;
  final Geometry geometry;
  final List<double> bbox;

  Feature({
    required this.type,
    required this.properties,
    required this.geometry,
    required this.bbox,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json['type'],
    properties: Location.fromJson(json['properties']),
    geometry: Geometry.fromJson(json['geometry']),
    bbox: List<double>.from(json['bbox']),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'properties': properties.toJson(),
    'geometry': geometry.toJson(),
    'bbox': bbox,
  };
}

class Geometry {
  final String type;
  final List<double> coordinates;

  Geometry({
    required this.type,
    required this.coordinates,
  });

  factory Geometry.fromJson(Map<String, 
  dynamic> json) => Geometry(
  type: json['type'],
  coordinates: List<double>.from(json['coordinates']), 

  );

  Map<String, dynamic> toJson() => {
  'type': type,
  'coordinates': coordinates, 

  };
}

class FeatureCollection {
  final String type;
  final List<Feature> features;
  final Query? query;

  FeatureCollection({
    required this.type,
    required this.features,
    required this.query,
  });

  factory FeatureCollection.fromJson(Map<String, dynamic> json) => FeatureCollection(
    type: json['type'],
    features: List<Feature>.from(
        json['features'].map((x) => Feature.fromJson(x))),
    query: Query.fromJson(json['query']),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'features': features.map((x) => x.toJson()).toList(),
    'query': query?.toJson(),
  };
}

class Query {
  final String text;
  final Parsed parsed;

  Query({
    required this.text,
    required this.parsed,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    text: json['text'],
    parsed: Parsed.fromJson(json['parsed']),
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'parsed': parsed.toJson(),
  };
}

class Parsed {
  final String city;
  final String expectedType;

  Parsed({
    required this.city,
    required this.expectedType,
  });

  factory Parsed.fromJson(Map<String, dynamic> json) => Parsed(
    city: json['city'],
    expectedType: json['expected_type'],
  );

  Map<String, dynamic> toJson() => {
    'city': city,
    'expected_type': expectedType,
  };
}