import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/models/user_model.dart';
import 'package:education_app/services/remote/body/change_password_body.dart';
import 'package:education_app/services/remote/body/login_body.dart';
import 'package:education_app/services/remote/body/register_body.dart';
import 'package:education_app/services/remote/body/forgot_password_body.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ImplAuthService {
  Future<dynamic> register(RegisterBody body);
  Future<dynamic> login(LoginBody body);
  Future<dynamic> forgotPassword(ForgotPasswordBody body);
  Future<bool> changePassword(ChangePasswordBody body);
}

class AuthService implements ImplAuthService {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<dynamic> login(LoginBody body) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: body.email ?? "",
      password: body.password ?? "",
    );
  }

  @override
  Future<dynamic> register(RegisterBody body) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: body.email ?? "",
      password: body.password ?? "",
    );

    UserModel user = UserModel()
      ..name = body.name
      ..email = body.email
      ..specialized = body.specialized
      ..avatar = body.avatar;

    await userCollection.doc(user.email).set(user.toJson());
  }

  @override
  Future<bool> changePassword(ChangePasswordBody body) async {
    try {
      final loginUser = FirebaseAuth.instance.currentUser;
      final credential = EmailAuthProvider.credential(
        email: body.email ?? '',
        password: body.currentPassword ?? '',
      );

      await loginUser?.reauthenticateWithCredential(credential);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<dynamic> forgotPassword(ForgotPasswordBody body) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: body.email ?? "",
    );
  }
}
