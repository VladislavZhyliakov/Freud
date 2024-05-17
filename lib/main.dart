import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/bottom_navigation_bar/presentation/bottom_navigation_bar.dart';
import 'package:freud/features/authentication/services/login_home_screens_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Freud());
}

class Freud extends StatelessWidget {
  const Freud({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LoginHomeScreensHandler(),
    );
  }
}


// void main(){
//   runApp(
//     const MaterialApp(
//       home: MyBottomNavigationBar(),
//     )
//   );
// }