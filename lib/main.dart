import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:login_firebase/features/home/presentation/home.page.dart';
import 'package:login_firebase/shared/domain/entities/user.entity.dart';
import 'package:login_firebase/shared/presentation/controllers/auth.controller.dart';

import 'features/login/presentation/login.page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingleton<AuthController>(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _initializeApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao inicializar o firebase'),
            );
          }

          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final authController = GetIt.I.get<AuthController>();

          return ValueListenableBuilder<UserEntity?>(
              valueListenable: authController.user,
              builder: (_, userLogged, __) {
                print('passou aqui');
                return MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  initialRoute: '/',
                  routes: {
                    '/': (_) {
                      if (authController.isLogged()) return HomePage();

                      return LoginPage();
                    },
                    '/home': (ctx) => HomePage(),
                  },
                );
              });
        });
  }
}
