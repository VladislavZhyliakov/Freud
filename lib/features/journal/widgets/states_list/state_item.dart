import 'package:freud/features/journal/models/user_state.dart';
import 'package:flutter/material.dart';

class StateItem extends StatelessWidget {
  const StateItem({super.key, required this.state});

  final UserState state;

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20, 
          vertical: 16
          ),
        child: Column(
          children: [
            Text(state.title),
            const SizedBox(height: 4),
            Row(
              children: [ 
                Text(state.description),
                const Spacer(),
                Row(
                  children: [ 
                    Image(image: moodIcons[state.mood]!.image, height: 30, width: 30,),
                    const SizedBox(width: 8),
                    Text(state.formattedDate),
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