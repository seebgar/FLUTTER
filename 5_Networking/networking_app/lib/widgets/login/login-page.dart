import 'package:flutter/material.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LayoutBuilder(
        builder: (context, dimensions) {
          final width = dimensions.maxWidth / 1.5;
          final heigth = dimensions.maxHeight / 3;

          return Center(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: heigth,
                  maxHeight: width,
                ),
                child: LoginForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
