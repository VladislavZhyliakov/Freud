import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to Freud!'),
          Text('Цитата дня:\nЖиття – це те, що відбувається з тобою, поки ти жваво будуєш інші плани.\nДжон Леннон'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.home),
              SizedBox(width: 30),
              Icon(Icons.chat),
              SizedBox(width: 30),
              Icon(Icons.menu_book_rounded),
              SizedBox(width: 30),
              Icon(Icons.task_alt),
            ],
          )
        ],
      ),
    );
  }
}