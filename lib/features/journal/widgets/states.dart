import 'package:freud/features/journal/widgets/states_list/states_list.dart';
import 'package:freud/features/journal/models/user_state.dart';
import 'package:freud/features/journal/widgets/new_state.dart';
import 'package:freud/stylings/colors_preferences.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<UserState> _registeredExpenses = [
    UserState(
        title: 'Я щасливий',
        description: 'Сьогодні я щасливий, бо виграв у лотореї',
        date: DateTime.now(),
        mood: Mood.happy),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(_addExpense),
    );
  }

  void _addExpense(UserState expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(UserState expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = StateList(
        states: _registeredExpenses,
        onRemoveState: _removeExpense,
      );
    }

    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: AppBar(
        backgroundColor: mainBackgroundColor,
        title: const Text('Журнал станів', style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
