import 'package:flutter/material.dart';
import 'package:freud/features/home/presentation/home_screen.dart';
import 'package:freud/features/chat/chat_main.dart';
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
    const PsychologistChat(),
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
                  icon: Icons.chat,
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
        )

        // appBar: AppBar(),
        // bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.transparent,
        //   buttonBackgroundColor: Colors.deepPurple,
        //   color: Colors.deepPurple,
        //   animationDuration: const Duration(milliseconds: 300),
        //   items: const [
        //     Icon(Icons.home, size: 26, color: Colors.white),
        //     Icon(Icons.note_add, size: 26, color: Colors.white),
        //     Icon(Icons.chat, size: 26, color: Colors.white),
        //     Icon(Icons.emoji_objects_rounded, size: 26, color: Colors.white),
        //     Icon(Icons.call, size: 26, color: Colors.white),
        //   ],
        //   onTap: (index) {
        //     setState(() {
        //       _page = index;
        //     });
        //   },
        // ),
        //  body: IndexedStack(index: _page, children: _screenOptions,)
        //Center(
        //     child: _screenOptions
        //         .elementAt(_page)), //Center(child: Text(_page.toString()),),
        );
  }
}
