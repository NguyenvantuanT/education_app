import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/services/local/shared_prefs.dart';

abstract class ImplAccountService {
  Future<dynamic> getUser(String email);
  Future<dynamic> updateUser(UserModel user);
}

class AccountService implements ImplAccountService {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

  @override
  Future<dynamic> getUser(String email) async {
    DocumentSnapshot<Object?> snapshot = await userCollection.doc(email).get();
    SharedPrefs.user = UserModel.fromJson(
      snapshot.data() as Map<String, dynamic>,
    );
  }

  @override
  Future<dynamic> updateUser(UserModel body) async {
    UserModel user = SharedPrefs.user ?? UserModel();
    await userCollection.doc(user.email).update(body.toJson());
  }
}
