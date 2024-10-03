import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String uid;
  String? username;
  String? email;
  String? photoUrl;
  bool? emailVerified;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? placeBirthDate;
  String? phone;
  String? sex;
  String? documentId;
  String? educationSystem;
  String? typeOfSchool;
  String? subtypeOdSchool;
  String? branch;
  String? class_;
  String? school;
  String? series;

  UserModel({
    required this.uid,
    this.username,
    this.email,
    this.photoUrl,
    this.emailVerified,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.placeBirthDate,
    this.phone,
    this.sex,
    this.documentId,
    this.educationSystem,
    this.typeOfSchool,
    this.subtypeOdSchool,
    this.branch,
    this.class_,
    this.school,
    this.series,
  });

  factory UserModel.fromUserCredential(UserCredential userCredential) {
    return UserModel(
      uid: userCredential.user!.uid,
      email: userCredential.user!.email,
      emailVerified: userCredential.user!.emailVerified,
      photoUrl: userCredential.user!.photoURL,
      // Add other properties as needed
    );
  }
  factory UserModel.fromMap(DocumentSnapshot data) {
    return UserModel(
      documentId: data.id,
      uid: data['uid'],
      email: data['email'],
      username: data['username'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      birthDate: data['birthDate'],
      placeBirthDate: data['placeBirthDate'],
      phone: data['phone'],
      sex: data['sex'],
      educationSystem: data['educationSystem'],
      typeOfSchool: data['typeOfSchool'],
      subtypeOdSchool: data['subtypeOdSchool'],
      branch: data['branch'],
      class_: data['class_'],
      school: data['school'],
      series: data['series'],

    );
  }
  Map<String, dynamic> toJson() => {
    'uid': uid,
    'username': username,
    'email': email,
    'photoUrl': photoUrl,
    'emailVerified': emailVerified,
    'firstName': firstName,
    'lastName': lastName,
    'birthDate': birthDate,
    'placeBirthDate': placeBirthDate,
    'phone': phone,
    'sex': sex,
    'documentId': documentId,
    'educationSystem': educationSystem,
    'typeOfSchool': typeOfSchool,
    'subtypeOdSchool': subtypeOdSchool,
    'branch': branch,
    'class_': class_,
    'school': school,
    'series': series,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json['uid'],
    username: json['username'],
    email: json['email'],
    photoUrl: json['photoUrl'],
    emailVerified: json['emailVerified'],
    documentId: json['documentId'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    birthDate: json['birthDate'],
    placeBirthDate: json['placeBirthDate'],
    sex: json['sex'],
    phone: json['phone'],
    educationSystem: json['educationSystem'],
    typeOfSchool: json['typeOfSchool'],
    subtypeOdSchool: json['subtypeOdSchool'],
    branch: json['branch'],
    class_: json['class_'],
    school: json['school'],
    series: json['series'],

  );
}
