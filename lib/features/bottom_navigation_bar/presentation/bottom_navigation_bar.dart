import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:freud/features/home/presentation/home_screen.dart';
import 'package:freud/features/chat/chat_main.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _page = 0;
  final List<Widget> _screenOptions = [
    const HomeScreen(),
    const Text('Журнал'),
    const PsychologistChat(),
    const Text('Вправи'),
    const Text('Гарячі лінії'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
       body: IndexedStack(index: _page, children: _screenOptions,)
       //Center(
      //     child: _screenOptions
      //         .elementAt(_page)), //Center(child: Text(_page.toString()),),
    );
  }
}
