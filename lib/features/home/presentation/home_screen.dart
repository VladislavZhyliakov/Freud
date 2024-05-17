import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

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
      appBar: AppBar(
        title: Text('Signed in as: ${user.email!}'),
        actions: [ElevatedButton(onPressed: () => FirebaseAuth.instance.signOut(), child: const Text('Sign Out'))],
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
