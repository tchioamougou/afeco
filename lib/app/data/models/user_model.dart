import 'package:afeco/app/ui/utils/constants.dart';

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
  double moneySaved;
  int carboneImpact;
  int bagsSaved;
  int excessFoodSaved;
  String image;
  int distance;
  List<String> storesLiked;
  bool isEmailNotificationsEnabled;
  bool isCalendarRemindersEnabled;
  bool isImportantUpdatesEnabled;
  bool isPushNotification;
  bool isAnnouncementsEnabled;
  List<int> reminderDays;

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
    required this.moneySaved,
    required this.carboneImpact,
    required this.bagsSaved,
    required this.excessFoodSaved,
    required this.image,
    required this.distance,
    required this.storesLiked,
    this.isEmailNotificationsEnabled = false,
    this.isCalendarRemindersEnabled = false,
    this.isImportantUpdatesEnabled = false,
    this.isPushNotification = false,
    this.isAnnouncementsEnabled = false,
    this.reminderDays = const [],
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
        moneySaved: double.parse('${json['moneySaved'] ?? 0}'),
        carboneImpact: json['carboneImpact'] ?? 0,
        bagsSaved: json['bagsSaved'] ?? 0,
        distance: json['distance'] ?? 2,
        excessFoodSaved: json['excessFoodSaved'] ?? 0,
        image: json['image'] ?? Constants.defaultImage,
        storesLiked: List<String>.from(json['storesLiked'] ?? []),
        reminderDays: List<int>.from(json['reminderDays'] ?? []),
        isEmailNotificationsEnabled:
            json['isEmailNotificationsEnabled'] ?? false,
        isCalendarRemindersEnabled: json['isCalendarRemindersEnabled'] ?? false,
        isImportantUpdatesEnabled: json['isImportantUpdatesEnabled'] ?? false,
        isPushNotification: json['isPushNotification'] ?? false,
        isAnnouncementsEnabled: json['isAnnouncementsEnabled'] ?? false,
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
        'moneySaved': moneySaved,
        'carboneImpact': carboneImpact,
        'bagsSaved': bagsSaved,
        'excessFoodSaved': excessFoodSaved,
        "image": image,
        'distance': distance,
        "storesLiked": storesLiked,
        "isEmailNotificationsEnabled": isEmailNotificationsEnabled,
        "isCalendarRemindersEnabled": isCalendarRemindersEnabled,
        "isImportantUpdatesEnabled": isImportantUpdatesEnabled,
        "isPushNotification": isPushNotification,
        "isAnnouncementsEnabled": isAnnouncementsEnabled,
        "reminderDays": reminderDays,
      };
}
