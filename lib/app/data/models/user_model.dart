
class UserModel {
  String userId;
  String name;
  String countryCode;
  String countryName;
  bool allow;
  String email;
  bool acceptEmailAlert;
  bool acceptNotification;
  double lat;
  double long;
  String documentId;

  UserModel({
    required this.userId,
    required this.name,
    required this.countryCode,
    required this.countryName,
    required this.allow,
    required this.email,
    required this.acceptEmailAlert,
    required this.acceptNotification,
    required this.lat,
    required this.long,
    required this.documentId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userId: json['userId'],
    name: json['name'],
    countryCode: json['countryCode'],
    countryName: json['countryName'],
    allow: json['allow'],
    email: json['email'],
    acceptEmailAlert: json['acceptEmailAlert'],
    acceptNotification: json['acceptNotification'],
    lat: double.parse('${json['lat']}'),
    long: double.parse('${json['long']}'),
    documentId: json['documentId'],
  );

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'name': name,
    'countryCode': countryCode,
    'countryName': countryName,
    'allow': allow,
    'email': email,
    'acceptEmailAlert': acceptEmailAlert,
    'acceptNotification': acceptNotification,
    'lat': lat,
    'long': long,
    'documentId': documentId,
  };
}