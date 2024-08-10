import 'package:flutter/material.dart';
import 'package:junkie/screens/auth/login_page.dart';
import 'package:junkie/screens/auth/register.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({super.key});

  @override
  State<AuthLayout> createState() => _LayoutState();
}

class _LayoutState extends State<AuthLayout> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onPressed: toggleScreens,
      );
    } else {
      return RegisterPage(
        onPressed: toggleScreens,
      );
    }
  }
}
