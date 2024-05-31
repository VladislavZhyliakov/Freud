// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/authentication/auth/auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.showRegisterPage});
  final VoidCallback showRegisterPage;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage = '';

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email == '' || password == '') {
      setState(() {
        errorMessage = 'Не всі поля заповнено';
      });
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        setState(() {
          errorMessage = e.message;
        });
      }
    }

    Navigator.of(context).pop();
  }

  Future addUserDetails(String uid, String firstName, String lastName,
      String email, int age) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'age': age,
    });
  }

  void googleAuth() {
    final gUser = AuthService().signInWithGoogle();

    var userAuth = FirebaseAuth.instance.currentUser!;

    addUserDetails(
        userAuth.uid, gUser.displayName, gUser.displayName, gUser.email, 18);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 21, 77),
      body: Stack(
        children: [
          Lottie.asset('assets/animations/welcome_page_animation.json'),
          SafeArea(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image.asset('assets/images/mental-health.png', width: 250, height: 180,),
                const SizedBox(height: 165),
                Text(
                  'Ласкаво просимо',
                  style: GoogleFonts.unbounded(
                    fontSize: 36,
                    color: Color.fromARGB(255, 232, 234, 246),
                  ),
                  textAlign: TextAlign.center,
                  // style: TextStyle(
                  //     fontSize: 52,
                  //     fontWeight: FontWeight.bold,
                  //     color: Color.fromARGB(255, 42, 101, 45)),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Знайдіть свій внутрішній спокій разом з Freud',
                    style: GoogleFonts.unbounded(
                      fontSize: 18,
                      color: Color.fromARGB(255, 232, 234, 246),
                    ),
                    textAlign: TextAlign.center,
                    // style: TextStyle(
                    //     fontSize: 24, color: Color.fromARGB(255, 42, 101, 45)),
                    // textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 165),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 82, 103, 220),
                      border: Border.all(
                          color: const Color.fromARGB(255, 232, 234, 246),
                          width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 82, 103, 220),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          hintText: 'Електронна пошта',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 15, 21, 77),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 82, 103, 220),
                      border: Border.all(
                          color: const Color.fromARGB(255, 232, 234, 246),
                          width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 82, 103, 220),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          hintText: 'Пароль',
                          hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 15, 21, 77),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  errorMessage == '' ? '' : 'Виникла проблема:\n$errorMessage',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 234, 246),
                      ),
                      color: const Color.fromARGB(255, 232, 234, 246),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: signIn,
                      child: const Text(
                        'Увійти',
                        style: TextStyle(
                          color: Color.fromARGB(255, 15, 21, 77),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: double.infinity,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 232, 234, 246),
                      ),
                      color: const Color.fromARGB(255, 232, 234, 246),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextButton(
                      onPressed: googleAuth,
                      child: const Text(
                        'Увійти з Google',
                        style: TextStyle(
                          color: Color.fromARGB(255, 15, 21, 77),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Не маєте облікового запису?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 232, 234, 246),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        ' Зареєструватись',
                        style: TextStyle(
                          fontSize: 16,
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
