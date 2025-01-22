import 'package:flutter/material.dart';
import 'package:json_to_dart_ui/json_builder.dart';
import 'package:json_to_dart_ui/storage/login_screen_json.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return JsonBuilder(json: loginScreenJson, onPressActions: {
      'handleLogin': () {
        print('Navigating to Login Screen');
      },
      'handleSignUp': () {
        print('Navigating to Sign Up Screen');
      }
    });
  }
}
