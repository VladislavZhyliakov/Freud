import 'package:freud/features/journal/models/user_state.dart';
import 'package:flutter/material.dart';

class StateItem extends StatelessWidget {
  const StateItem({super.key, required this.state});

  final UserState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 204, 241, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color.fromARGB(255, 15, 21, 77), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(
              state.title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 15, 21, 77),),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        state.description,
                        style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 15, 21, 77),

                            //fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Row(
                  children: [
                    Image(
                      image: moodIcons[state.mood]!.image,
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      state.formattedDate,
                      style: const TextStyle(fontSize: 18, color: Color.fromARGB(255, 15, 21, 77),

                          //fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
