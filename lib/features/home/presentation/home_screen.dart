import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:freud/features/home/presentation/home_screen.dart';
import 'package:freud/features/chat/chat_main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/features/authentication/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title(){
    return const Text('Firebase Auth');
  }

  Widget _userUid(){
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton(){
    return ElevatedButton(onPressed: signOut, child: const Text('Sign out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[ 
            _userUid(),
            _signOutButton(),
          ],
        ),
      )
    )
    ; /*Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to Freud!'),
          Text('Цитата дня:\nЖиття – це те, що відбувається з тобою, поки ти жваво будуєш інші плани.\nДжон Леннон'),
        ],
      ),
    );*/
  }
}