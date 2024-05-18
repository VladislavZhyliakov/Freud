import 'package:freud/features/chat_psychologist/pages/chat_page.dart';

import 'package:flutter/material.dart';

class ChatHus extends StatelessWidget {
  const ChatHus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}
