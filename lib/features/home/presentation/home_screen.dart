import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/stylings/colors_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userAuth = FirebaseAuth.instance.currentUser!;
  final user = FirebaseFirestore.instance.collection('users');
  String userName = '';

 @override
  void initState() {
    getUserInfo();
    super.initState();
  }

 Future<void> getUserInfo() async {
    DocumentSnapshot userDoc = await user.doc(userAuth.uid).get();
    setState(() {
      userName = userDoc['firstName'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: Text('Привіт, $userName!', style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 36),),
        actions: [IconButton(onPressed: () => FirebaseAuth.instance.signOut(), icon: const Icon(Icons.exit_to_app, size: 36,))],
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Ласково просимо до Freud!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36), textAlign: TextAlign.center,),
          const SizedBox(height: 20,),
          Image.asset('assets/images/logo.png', width: 300, height: 300),
        ],
      ),
    );
  }
}
