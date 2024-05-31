import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/excercises/psychological_excercises/square_breathing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/stylings/colors_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

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
      backgroundColor: const Color.fromARGB(255, 82, 103, 220),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 103, 220),
        centerTitle: false,
        title: Text(
          'Привіт,  $userName!',
          style: GoogleFonts.unbounded(
            fontSize: 22,
            color: Colors.white,
            //fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
                await GoogleSignIn().disconnect();
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 28,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),

            //App functions

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Text(
                    'Як ви себе почуваєте?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Не забудьте зробити запис у журналі  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.note),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Хочете поспілкуватись?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Напишіть Фройду  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.chat_bubble),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Відчуваєте неспокій?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Виконайте корисну вправу  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.star),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Терміново потрібна допомога?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Подзвоніть по гарячій лінії  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.call),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),

            //),
            Lottie.asset(
              'assets/animations/home_page_animation.json',
              height: 250,
            ),
            const SizedBox(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
