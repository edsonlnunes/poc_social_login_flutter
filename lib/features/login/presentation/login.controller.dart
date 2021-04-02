import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/shared/domain/entities/user.entity.dart';
import 'package:login_firebase/shared/presentation/controllers/auth.controller.dart';

class LoginController {
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  void toggleLoading() => isLoading.value = !isLoading.value;

  Future<void> doLoginGoogle() async {
    toggleLoading();
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final firebaseUser =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final token = await firebaseUser.user?.getIdToken();

    final authController = GetIt.I.get<AuthController>();

    final user = UserEntity(
      email: firebaseUser.user!.email!,
      name: firebaseUser.user!.displayName!,
      pictureURL: firebaseUser.user!.photoURL!,
      token: token!,
    );

    authController.userLogged = user;
    toggleLoading();
  }

  Future<void> doLoginFacebook() async {
    toggleLoading();

    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      final firebaseUser =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final token = await firebaseUser.user?.getIdToken();

      final authController = GetIt.I.get<AuthController>();

      final user = UserEntity(
        email: firebaseUser.user!.email!,
        name: firebaseUser.user!.displayName!,
        pictureURL: firebaseUser.user!.photoURL!,
        token: token!,
      );

      authController.userLogged = user;
    }

    toggleLoading();
  }
}
