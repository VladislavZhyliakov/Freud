import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:freud/features/home/presentation/home_screen.dart';
import 'package:freud/features/chat/chat_main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/features/authentication/services/auth_service.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _page = 0;
  static List<Widget> _screenOptions = [ HomeScreen(), Text('Журнал'), PsychologistChat(),Text('Вправи'),Text('Гарячі лінії'),];

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
      bottomNavigationBar: CurvedNavigationBar(    
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.deepPurple,
        color: Colors.deepPurple,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 26, color: Colors.white),
          Icon(Icons.note_add, size: 26, color: Colors.white),
          Icon(Icons.chat, size: 26, color: Colors.white),
          Icon(Icons.emoji_objects_rounded, size: 26, color: Colors.white),
          Icon(Icons.call, size: 26, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Center(child: _screenOptions.elementAt(_page)),//Center(child: Text(_page.toString()),),

      
    );
  }
}