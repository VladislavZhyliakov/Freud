import 'package:freud/features/journal/widgets/states_list/state_item.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/journal/models/user_state.dart';


class StateList extends StatelessWidget {
  const StateList(
      {super.key, required this.states, required this.onRemoveState});

  final List<UserState> states;
  final void Function(UserState expense) onRemoveState;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: states.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(states[index]),
        onDismissed: (direction) {
          onRemoveState(states[index]);
        },
        child: StateItem(
          state: states[index],
        ),
      ),
    );
  }
}
