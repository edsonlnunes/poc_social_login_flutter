import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_firebase/shared/domain/entities/user.entity.dart';
import 'package:login_firebase/shared/presentation/controllers/auth.controller.dart';

class HomePage extends StatelessWidget {
  final authController = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            ValueListenableBuilder<UserEntity?>(
                valueListenable: authController.user,
                builder: (_, userLogged, __) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(userLogged?.name ?? ''),
                    accountEmail: Text(userLogged?.email ?? ''),
                    currentAccountPicture: userLogged?.pictureURL != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(userLogged!.pictureURL),
                          )
                        : null,
                  );
                }),
            ListTile(
              title: Text('Sair'),
              onTap: () async {
                await authController.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
