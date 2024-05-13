import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to Freud!'),
          Text('Цитата дня:\nЖиття – це те, що відбувається з тобою, поки ти жваво будуєш інші плани.\nДжон Леннон'),
        ],
      ),
    );
  }
}