import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/stylings/colors_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        title: Text(
          'Привіт,  $userName!',
          style: GoogleFonts.unbounded(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                await GoogleSignIn().disconnect();
              },
              icon: const Icon(
                Icons.exit_to_app,
                size: 36,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Який у вас настрій? Не забудьте зробити запис в журналі'),
          OutlinedButton(onPressed: () {}, child: Text('Журнал станів')),
          Text('Хочете поспілкуватись? Напишіть Фройду'),
          OutlinedButton(onPressed: () {}, child: Text('Чат з Фройдом')),
          Text('Відчуваєте неспокій? Виконайте вправу на вибів'),
          OutlinedButton(onPressed: () {}, child: Text('Вправи')),
          Text('Терміново потрібна допомога? Подзвоніть по гарячій лінії'),
          OutlinedButton(onPressed: () {}, child: Text('Гарячі лінії')),
          // const Text(
          //   'Ласкаво просимо до Freud!',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          //   textAlign: TextAlign.center,
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Image.asset('assets/images/logo.png', width: 300, height: 300),
        ],
      ),
    );
  }
}
