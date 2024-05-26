// import 'package:freud/features/journal/widgets/states_list/states_list.dart';
// import 'package:freud/features/journal/models/user_state.dart';
// import 'package:freud/features/journal/widgets/new_state.dart';
// import 'package:freud/stylings/colors_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:freud/features/journal/controllers/state_controller.dart';

// class States extends StatefulWidget {
//   const States({super.key});

//   @override
//   State<States> createState() {
//     return _StatesState();
//   }
// }

// class _StatesState extends State<States> {
//   StateController stateController = StateController();

//   List<UserState> _registeredStates = [
//     UserState(
//         title: '1', description: 'const', date: DateTime.now(), mood: Mood.good)
//   ];

//   void _openAddStateOverlay() {
//     showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (ctx) => NewState(_addState),
//     );
//   }

//   void _addState(UserState state) {
//     setState(() {
//       _registeredStates.add(state);
//     });
//   }

//   void _removeState(UserState state) {
//     final stateIndex = _registeredStates.indexOf(state);
//     setState(() {
//       _registeredStates.remove(state);
//     });
//     ScaffoldMessenger.of(context).clearSnackBars();
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         duration: const Duration(seconds: 3),
//         content: const Text('State deleted.'),
//         action: SnackBarAction(
//           label: 'Undo',
//           onPressed: () {
//             setState(() {
//               _registeredStates.insert(stateIndex, state);
//             });
//           },
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget mainContent = const Center(
//       child: Text('No states found. Start adding some!'),
//     );

//     if (_registeredStates.isNotEmpty) {
//       mainContent = StateList(
//         states: _registeredStates,
//         onRemoveState: _removeState,
//       );
//     }

//     return Scaffold(
//       backgroundColor: mainBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: mainBackgroundColor,
//         title: const Text(
//           'Журнал станів',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           IconButton(
//               onPressed: _openAddStateOverlay, icon: const Icon(Icons.add))
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: mainContent,
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:freud/features/journal/widgets/states_list/states_list.dart';
import 'package:freud/features/journal/models/user_state.dart';
import 'package:freud/features/journal/widgets/new_state.dart';
import 'package:freud/stylings/colors_preferences.dart';
import 'package:flutter/material.dart';
import 'package:freud/features/journal/controllers/state_controller.dart';

class States extends StatefulWidget {
  const States({super.key});

  @override
  State<States> createState() {
    return _StatesState();
  }
}

class _StatesState extends State<States> {
  StateController stateController = StateController();

  List<UserState> _registeredStates = [];

  bool undoDeleteCheck = false;

  @override
  void initState() {
    super.initState();
    _fetchUserStates();
  }

  void _fetchUserStates() {
    stateController.getUserStates().listen((userStates) {
      setState(() {
        _registeredStates = userStates;
      });
    });
  }

  void _openAddStateOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewState(_addState),
    );
  }

  void _addState(UserState state) {
    setState(() {
      _registeredStates.add(state);
    });
  }

  void _removeState(UserState state) {
    final stateIndex = _registeredStates.indexOf(state);
    setState(() {
      _registeredStates.remove(state);
      stateController.deleteState(state.date);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('State deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              //undoDeleteCheck = true;
              _registeredStates.insert(stateIndex, state);
              stateController.addNewState(state);
            });
          },
        ),
      ),
    );
    // if (undoDeleteCheck == false) {
    //   setState(() {
    //     stateController.deleteState(state.date);
    //   });
    // }
    // undoDeleteCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No states found. Start adding some!'),
    );

    if (_registeredStates.isNotEmpty) {
      mainContent = StateList(
        states: _registeredStates,
        onRemoveState: _removeState,
      );
    }

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text(
          'Журнал станів',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: _openAddStateOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: StreamBuilder<List<UserState>>(
        stream: stateController.getUserStates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No states found. Start adding some!'));
          } else {
            _registeredStates = snapshot.data!;
            return StateList(
              states: _registeredStates,
              onRemoveState: _removeState,
            );
          }
        },
      ),
    );
  }
}
