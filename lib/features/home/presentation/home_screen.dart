import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/stylings/colors_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: Text('Привіт ${user.email!}'),
        actions: [IconButton(onPressed: () => FirebaseAuth.instance.signOut(), icon: Icon(Icons.exit_to_app))],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to Freud!'),
          Text(
              'Цитата дня:\nЖиття – це те, що відбувається з тобою, поки ти жваво будуєш інші плани.\nДжон Леннон'),
        ],
      ),
    );
  }
}
