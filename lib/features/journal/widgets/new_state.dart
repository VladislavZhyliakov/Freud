import 'package:flutter/material.dart';
import 'package:freud/features/journal/models/user_state.dart';
import 'package:freud/features/journal/controllers/state_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

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
    final enteredAmount = _amountController.text;
    final amountIsInvalid = enteredAmount == '';

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Введені неправильні дані'),
          content: const Text('Будь ласка перевірте чи ви заповнили усі поля правильно'),
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
    stateId = stateController.addNewState(UserState(
        title: _titleController.text,
        description: enteredAmount,
        date: _selectedDate!,
        mood: _selectedCategory));
    widget.onAddState(UserState(
        title: _titleController.text,
        description: enteredAmount,
        date: _selectedDate!,
        mood: _selectedCategory));
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 21, 77),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Створіть новий запис',
              style: GoogleFonts.unbounded(
                fontSize: 28,
                color: const Color.fromARGB(255, 232, 234, 246),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 74, 179, 217),
                  border: Border.all(
                      color: const Color.fromARGB(255, 232, 234, 246), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                    maxLength: 50,
                    controller: _titleController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 74, 179, 217),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      hintText: 'Стан',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 15, 21, 77),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 74, 179, 217),
                  border: Border.all(
                      color: const Color.fromARGB(255, 232, 234, 246), width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: TextField(
                    maxLength: 1000,
                    controller: _amountController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 74, 179, 217),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      hintText: 'Опис',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 15, 21, 77),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // TextField(
            //   controller: _titleController,
            //   maxLength: 50,
            //   keyboardType: TextInputType.text,
            //   decoration: const InputDecoration(
            //     label: Text(
            //       'Стан',
            //       style: TextStyle(),
            //     ),
            //   ),
            // ),
            // TextField(
            //   controller: _amountController,
            //   keyboardType: TextInputType.text,
            //   decoration: const InputDecoration(
            //     label: Text('Опис'),
            //   ),
            // ),
            const SizedBox(
              height: 20,
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
                      Text(
                        _selectedDate == null
                            ? 'Дату не обрано'
                            : formatter.format(_selectedDate!),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 232, 234, 246),
                        ),
                      ),
                      IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(255, 232, 234, 246),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  DropdownButton(
                      value: _selectedCategory,
                      items: Mood.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Image(
                            image: moodIcons[category]!.image,
                            height: 30,
                            width: 30,
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
                    child: const Text(
                      'Відмінити',
                      style: TextStyle(
                        color: Color.fromARGB(255, 232, 234, 246),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _submitStateData,
                    child: const Text(
                      'Зберегти стан',
                      style: TextStyle(
                        color: Color.fromARGB(255, 15, 21, 77),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
