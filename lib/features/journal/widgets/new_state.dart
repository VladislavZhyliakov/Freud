import 'package:flutter/material.dart';
import 'package:freud/features/journal/models/user_state.dart';
import 'package:freud/features/journal/controllers/state_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';


class NewState extends StatefulWidget {
  const NewState(this.onAddState, {super.key});

  final void Function(UserState state) onAddState;

  @override
  State<NewState> createState() => _NewStateState();
}

class _NewStateState extends State<NewState> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Mood _selectedCategory = Mood.good;
  StateController stateController = StateController();
  var userAuth = FirebaseAuth.instance.currentUser!;
  var stateId;


  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitStateData() {
    final enteredAmount =_amountController.text;
    final amountIsInvalid = enteredAmount == '';

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Введені неправильні дані'),
          content: const Text(
              'Будь ласка чи ви заповнили усі поля правильно'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Гаразд'),
            ),
          ],
        ),
      );
      return;
    }
    stateId = stateController.addNewState(UserState(title: _titleController.text, description: enteredAmount, date: _selectedDate!, mood: _selectedCategory));
    widget.onAddState(UserState(title: _titleController.text, description: enteredAmount, date: _selectedDate!, mood: _selectedCategory));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              label: Text('Стан'),
            ),
          ),
         TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text('Опис'),
                  ),
                ),
           
          Row(
            children: [
              
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null
                        ? 'Дату не обрано'
                        : formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(
                        Icons.calendar_month,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Mood.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(
                        category.name.toUpperCase(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Відмінити'),
              ),
              ElevatedButton(
                onPressed: _submitStateData,
                child: const Text('Зберегти стан'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
