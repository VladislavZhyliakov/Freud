import 'package:flutter/material.dart';
import 'package:freud/features/chat_psychologist/chat.dart';
import 'package:freud/features/home/presentation/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _page = 0;
  final List<Widget> _screenOptions = [
    const HomeScreen(),
    const Center(child: Text('Журнал')),
    const ChatHus(),
    const Center(child: Text('Вправи')),
    const Center(child: Text('Гарячі лінії')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            rippleColor: Colors.blue,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Головна',
                rippleColor: Colors.grey,
              ),
              GButton(
                icon: Icons.note,
                text: 'Журнал',
                rippleColor: Colors.deepPurpleAccent,
              ),
              GButton(
                icon: Icons.chat_bubble,
                text: 'Чат',
                rippleColor: Colors.green,
              ),
              GButton(
                icon: Icons.star,
                text: 'Вправи',
                rippleColor: Colors.indigoAccent,
              ),
              GButton(
                icon: Icons.call,
                text: 'Гарячі Контакти',
                rippleColor: Colors.red,
              ),
            ],
            onTabChange: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
        ),
      ),
      body: IndexedStack(
        index: _page,
        children: _screenOptions,
      ),
    );
  }
}
