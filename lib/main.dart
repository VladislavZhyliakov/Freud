import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/authentication/auth/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const mainBackgroundColor = Color(0xFFF9F2E7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}