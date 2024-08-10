import 'package:flutter/material.dart';
import 'package:junkie/screens/auth/login_page.dart';
import 'package:junkie/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(
        onPressed: () {},
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
