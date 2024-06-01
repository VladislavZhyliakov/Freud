import 'package:flutter/material.dart';
import 'package:freud/features/excercises/psychological_excercises/five_feelings.dart';
import 'package:freud/features/excercises/psychological_excercises/safe.dart';
import 'package:freud/features/excercises/psychological_excercises/square_breathing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ExcercisesPage extends StatelessWidget {
  const ExcercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 241, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 241, 255),
        title: Center(
          child: Text(
            'Психологічні вправи',
            style: GoogleFonts.unbounded(
              fontSize: 28,
              color: const Color.fromARGB(255, 15, 21, 77),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(
        children: [
          Lottie.asset('assets/animations/meditation2.json'),
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset(
                'assets/images/square_breathing_icon.png',
                height: 40,
                width: 80,
                color: const Color.fromARGB(255, 15, 21, 77),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BreathingSquare(),
                  ),
                );
              },
              title: const Text(
                'Дихання по квадрату',
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 21, 77),
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 15, 21, 77),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BreathingSquare(),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset(
                'assets/images/5_feelings_icon.png',
                height: 40,
                width: 80,
                color: const Color.fromARGB(255, 15, 21, 77),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FiveFeelings(),
                  ),
                );
              },
              title: const Text(
                '5 відчуттів',
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 21, 77),
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 15, 21, 77),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FiveFeelings(),
                    ),
                  );
                },
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset(
                'assets/images/safe_icon.png',
                height: 45,
                width: 80,
                color: const Color.fromARGB(255, 15, 21, 77),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SafePage(),
                  ),
                );
              },
              title: const Text(
                'Сейф',
                style: TextStyle(
                  color: Color.fromARGB(255, 15, 21, 77),
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 15, 21, 77),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SafePage(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
