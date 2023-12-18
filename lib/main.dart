import 'package:flutter/material.dart';
import 'package:social_media_app/src/auth/register_or_login.dart';

import 'src/theme/dark_mode.dart';
import 'src/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const AuthenticationPage(),
    );
  }
}
