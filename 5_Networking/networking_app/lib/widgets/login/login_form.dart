import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  /// * used for form validation and data
  final _formKey = GlobalKey<FormState>();

  /// * text controller -> gets the input strings
  final emailCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  /// * Text input validator
  /// @returns str message if error else null
  String _validateText(String value) {
    if (value.isEmpty)
      return "Field cannot be empty.";
    else
      return null;
  }

  /// * Password input validator
  /// @returns str message if error else null
  String _validatePassword(String value) {
    if (value.length < 8) {
      return "At least 8 chars are required.";
    }
    return null;
  }

  /// * Login submit
  void _login() {
    // valid inputs check
    if (_formKey.currentState.validate() ?? false) {
      // login logic
      final email = emailCtr.text;
      final passw = passwordCtr.text;
    } else {
      // invalid inputs
    }
  }

  @override
  void dispose() {
    emailCtr.dispose(); // **
    passwordCtr.dispose(); // **

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // * email input
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.mail),
              hintText: "Email",
            ),
            validator: _validateText,
            controller: emailCtr,
            maxLength: 50,
          ),
          // * password input
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.vpn_key),
              hintText: "Password",
            ),
            obscureText: true,
            validator: _validatePassword,
            controller: passwordCtr,
          ),
          // * confirmation button
          TextButton(
            onPressed: _login,
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
}
