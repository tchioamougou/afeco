import 'package:afeco/app/data/services/session_service.dart';
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:get/get.dart';

final client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('save-food')
    .setSelfSigned(status: true);
String databaseId ="6708112a0007abf9bef1";
Account account = Account(client);
final databases = Databases(client);
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

  Future<Document> createDocument(String collectionId, Map<String, dynamic> data) async {
    return  await databases.createDocument(databaseId: databaseId, collectionId: collectionId, documentId: ID.unique(), data: data);
  }
}