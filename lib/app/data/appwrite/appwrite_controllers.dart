import 'package:afeco/app/data/services/session_service.dart';
import 'package:afeco/app/ui/utils/constants.dart';
import 'package:appwrite/appwrite.dart';
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
}
