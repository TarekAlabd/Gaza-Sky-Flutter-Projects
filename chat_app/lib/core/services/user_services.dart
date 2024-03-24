import 'package:chat_app/core/models/user_data.dart';
import 'package:chat_app/core/services/firestore_services.dart';
import 'package:chat_app/core/utils/api_path.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestoreService = FirestoreService.instance;

  Future<UserData> getUser() async {
    final user = _firebaseAuth.currentUser;
    final userData = await _firestoreService.getDocument(
      path: ApiPath.user(user!.uid),
      builder: (data, documentId) => UserData.fromMap(data),
    );
    return userData;
  }
}
