import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nannycare/auth/views/model/user.dart';

class UserDataService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fetch user data by UID
  Future<UserData> getUserData(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserData.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception("User not found");
      }
    } catch (e) {
      throw Exception("Error fetching user data: $e");
    }
  }
}
