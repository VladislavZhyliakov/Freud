import 'package:flutter/material.dart';
import 'package:freud/features/excercises/psychological_excercises/five_feelings.dart';
import 'package:freud/features/excercises/psychological_excercises/safe.dart';
import 'package:freud/features/excercises/psychological_excercises/square_breathing.dart';
import 'package:freud/stylings/colors_preferences.dart';

class ExcercisesPage extends StatelessWidget {
  const ExcercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Center(
            child: Text(
          'Психологічні вправи',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.asset(
                'assets/images/square_breathing_icon.png',
                height: 40,
                width: 80,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BreathingSquare(),
                  ),
                );
              },
              title: const Text('Дихання по квадрату'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.blue),
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
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FiveFeelings(),
                  ),
                );
              },
              title: const Text('5 відчуттів'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.blue),
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
                'assets/images/safe_icon.png',
                height: 40,
                width: 80,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SafePage(),
                  ),
                );
              },
              title: const Text('Сейф'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Colors.blue),
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
