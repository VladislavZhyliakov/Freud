import 'package:flutter/material.dart';
import 'package:freud/features/chat_psychologist/pages/chat_page.dart';
import 'package:freud/features/excercises/excercises_page.dart';
import 'package:freud/features/home/presentation/home_screen.dart';
import 'package:freud/features/hotlines/hotlines_page.dart';
import 'package:freud/stylings/colors_preferences.dart';
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
    const ChatPage(),
    const ExcercisesPage(),
    // ignore: prefer_const_constructors
    const CrisisContactsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      body: IndexedStack(
        index: _page,
        children: _screenOptions,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: GNav(
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              rippleColor: Colors.grey,
              tabBackgroundColor: Colors.grey.shade800,
              gap: 8,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Головна',
                ),
                GButton(
                  icon: Icons.note,
                  text: 'Журнал',
                ),
                GButton(
                  icon: Icons.chat_bubble,
                  text: 'Чат',
                ),
                GButton(
                  icon: Icons.star,
                  text: 'Вправи',
                ),
                GButton(
                  icon: Icons.call,
                  text: 'Гарячі Лінії',
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
      ),
    );
  }
}
