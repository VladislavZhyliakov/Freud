import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      //   centerTitle: false,
      //   title: Text(
      //     'Привіт,  $userName!',
      //     style: GoogleFonts.unbounded(
      //       fontSize: 32,
      //       color: Colors.white,
      //       //fontWeight: FontWeight.w500,
      //     ),
      //     textAlign: TextAlign.start,
      //   ),
      //   // actions: [
      //   //   IconButton(
      //   //       onPressed: () async {
      //   //         FirebaseAuth.instance.signOut();
      //   //         await GoogleSignIn().disconnect();
      //   //       },
      //   //       icon: const Icon(
      //   //         Icons.exit_to_app,
      //   //         color: Colors.white,
      //   //         size: 28,
      //   //       ))
      //   // ],
      // ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            //width: double.infinity,
            //color: const Color.fromARGB(255, 204, 241, 255),
          ),
          Positioned(
            bottom: 0,
            child: Lottie.asset('assets/animations/boats.json'),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Привіт,  $userName! ',
                                style: GoogleFonts.unbounded(
                                  fontSize: 28,
                                  color: const Color.fromARGB(255, 15, 21, 77),
                                  //fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  FirebaseAuth.instance.signOut();
                                  await GoogleSignIn().disconnect();
                                },
                                icon: const Icon(
                                  Icons.exit_to_app,
                                  color: Color.fromARGB(255, 15, 21, 77),
                                  size: 32,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  //App functions

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Як ви себе почуваєте?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 21, 77),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Не забудьте зробити запис у журналі  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 33, 100, 159),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.note,
                              color: Color.fromARGB(255, 15, 21, 77),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Хочете поспілкуватись?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 21, 77),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Напишіть Фройду  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 33, 100, 159),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.chat_bubble,
                              color: Color.fromARGB(255, 15, 21, 77),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Відчуваєте неспокій?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 21, 77),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Виконайте корисну вправу  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 33, 100, 159),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 15, 21, 77),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Терміново потрібна допомога?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 21, 77),
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Подзвоніть по гарячій лінії  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 33, 100, 159),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.call,
                              color: Color.fromARGB(255, 15, 21, 77),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  //const Spacer(),

                  //),
                  // Lottie.asset(
                  //   'assets/animations/home_page_animation.json',
                  //   height: 250,
                  // ),

                  // Lottie.asset(
                  //   'assets/animations/boats.json',
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
