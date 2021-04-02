import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:login_firebase/features/login/presentation/login.controller.dart';

class LoginPage extends StatelessWidget {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/one_piece.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black38,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 50,
                  child: SignInButton(
                    Buttons.Google,
                    text: 'Entrar com o google',
                    onPressed: () async {
                      await controller.doLoginGoogle();
                    },
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: controller.isLoading,
                  builder: (_, isLoading, __) {
                    return AnimatedContainer(
                      duration: Duration(
                        milliseconds: 500,
                      ),
                      height: isLoading ? 100 : 70,
                      child: isLoading
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Entrando...',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          : null,
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: SignInButton(
                    Buttons.Facebook,
                    text: 'Entrar com o facebook',
                    onPressed: () async {
                      await controller.doLoginFacebook();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
