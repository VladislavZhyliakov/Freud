import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/authentication/auth/auth_page.dart';
import 'package:freud/features/bottom_navigation_bar/presentation/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyBottomNavigationBar();
          } else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
