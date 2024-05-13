import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:freud/features/home/presentation/home_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _page = 0;
  static const List<Widget> _screenOptions = [HomeScreen(), Text('2'), Text('3'),Text('4'),Text('2'),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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