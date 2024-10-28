import 'dart:convert';

import 'package:afeco/app/data/services/filter_service.dart';
import 'package:afeco/app/data/services/language_service.dart';
import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/data/services/store_service.dart';
import 'package:afeco/app/data/services/user_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

final client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('save-food')
    .setSelfSigned(status: true);
String databaseId = "6708112a0007abf9bef1";
Account account = Account(client);
final databases = Databases(client);
final storage = Storage(client);
final realTime = Realtime(client);
Functions functions = Functions(client);
final subscription =  realTime.subscribe([
  "databases.6708112a0007abf9bef1.collections.${AppWriteCollection.bagsCollections}.documents",
  "databases.6708112a0007abf9bef1.collections.${AppWriteCollection.bagOrderCollections}.documents"
]);

class SaveFoodAppWriteController extends GetxController {
  String userId = '';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> createEmail(email) async {
    final sessionToken =
        await account.createEmailToken(userId: ID.unique(), email: email);
    userId = sessionToken.userId;
  }

  Future<User> createStoreAccount(
      String email, String password, String name) async {
    User user = await account.create(
        userId: 'Store_${ID.unique()}',
        email: email,
        password: password,
        name: name);
    await createEmailSession(user.email, password);
    return user;
  }

  Future<void> createEmailSession(String email, String password) async {
    Session ss = await account.createEmailPasswordSession(
        email: email, password: password);
    SessionService.instance.currentSession = ss;
  }

  Future<void> createPhone(phone) async {
    final sessionToken =
        await account.createPhoneToken(userId: ID.unique(), phone: phone);
    userId = sessionToken.userId;
  }

  Future<void> loginUser(String otp) async {
    Session ss = await account.createSession(userId: userId, secret: otp);
    SessionService.instance.currentSession = ss;
  }

// to logout the user and delete session
  Future logoutUser() async {
    if (SessionService.instance.currentSession != null) {
      await account.deleteSession(
          sessionId: SessionService.instance.currentSession!.$id);
    }
    FilterService.instance.removeUser();
    LanguageService.instance.removeLanguage();
    SessionService.instance.removeSession();
    StoreService.instance.removeStore();
    UserService.instance.removeUser();
  }

  Future<void> sendEmailVerificationCode() async {
    await account.createVerification(url: 'https://localhost:8080' // url
        );
  }

  Future<Document> createDocument(
      String collectionId, Map<String, dynamic> data) async {
    final id = ID.unique();
    data['documentId'] = id;
    return await databases.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: id,
        data: data);
  }

  /// this function is used to update documents
  Future<Document> updateDocument(
      String collectionId, String documentId, Map<String, dynamic> data) async {
    return await databases.updateDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: documentId,
        data: data);
  }

  Future<DocumentList> getDocuments(
      String collectionId, List<String> queries) async {
    try {
      return await databases.listDocuments(
          databaseId: databaseId, collectionId: collectionId, queries: queries);
    } on AppwriteException catch (e) {
      return Future.error(e);
    }
  }

  Future<String> createFile(String path, String fileName) async {
    File fl = await storage.createFile(
      bucketId: AppWriteBucket.profileBucket,
      fileId: ID.unique(),
      file: InputFile.fromPath(path: path, filename: fileName),
    );
    return fl.$id;
  }

  Future<String> deleteFile(String fileId) async {
    File fl = await storage.deleteFile(
      bucketId: AppWriteBucket.profileBucket,
      fileId: fileId,
    );
    return fl.$id;
  }
  Future<dynamic> confirmOrder(Map<String,String> params) async {
    Execution result = await functions.createExecution(
      functionId: '671f2df40026f6b142f1',
      body: jsonEncode(params), // optional
      xasync: false, // optional
      path: 'confirmation', // optional
      method: ExecutionMethod.pOST, // optional
      headers: {}, // optional
    );
    print(result.status.toString());
    print(result.responseBody.toString());
    return result;
  }
}

Future logoutUser() async {
  if (SessionService.instance.currentSession != null) {
    try {
      await account.deleteSession(
          sessionId: SessionService.instance.currentSession!.$id);
    } catch (e) {
      print(e);
    }
  }
  FilterService.instance.removeUser();
  SessionService.instance.removeSession();
  StoreService.instance.removeStore();
  UserService.instance.removeUser();
}

