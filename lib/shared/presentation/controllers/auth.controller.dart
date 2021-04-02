import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/shared/domain/entities/user.entity.dart';

class AuthController {
  ValueNotifier<UserEntity?> _userLogged = ValueNotifier(null);

  ValueNotifier<UserEntity?> get user => _userLogged;

  set userLogged(UserEntity user) => _userLogged.value = user;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    _userLogged.value = null;
  }

  Future<void> _loadDataUserLogged() async {
    if (_userLogged.value == null) {
      final firebaseUser = FirebaseAuth.instance.currentUser!;

      final token = await firebaseUser.getIdToken();

      _userLogged.value = UserEntity(
        email: firebaseUser.email!,
        name: firebaseUser.displayName!,
        pictureURL: firebaseUser.photoURL!,
        token: token,
      );
    }
  }

  bool isLogged() {
    final userLogged = FirebaseAuth.instance.currentUser;

    if (userLogged != null) {
      _loadDataUserLogged();
      return true;
    }

    return false;
  }
}
