import 'package:flutter/material.dart';
import 'package:freud/features/authentication/services/auth_service.dart';
import 'package:freud/features/authentication/screens/login_register_screen.dart';
import 'package:freud/features/bottom_navigation_bar/presentation/bottom_navigation_bar.dart';


class LoginHomeScreensHandler extends StatefulWidget {
  const LoginHomeScreensHandler({super.key});

  @override
  State<LoginHomeScreensHandler> createState() => _LoginHomeScreensHandlerState();
}

class _LoginHomeScreensHandlerState extends State<LoginHomeScreensHandler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return MyBottomNavigationBar();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}