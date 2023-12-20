import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/home_page.dart';
import 'package:social_media_app/src/auth/auth.dart';
import 'package:social_media_app/src/auth/register_or_login.dart';

import 'firebase_options.dart';
import 'src/profile_page.dart';
import 'src/theme/dark_mode.dart';
import 'src/theme/light_mode.dart';
import 'src/users_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthPage(),
      routes: {
        "/login-page": (context) => const AuthenticationPage(),
        "/home-page": (context) => const HomePage(),
        "/profile-page": (context) => const ProfilePage(),
        "/users-page": (context) => const UsersPage(),
      },
    );
  }
}
