import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Mood {
  verysad, sad, neutral, good, happy
}

final moodIcons = {
  Mood.verysad: Image.asset('assets/images/very_sad.png'),
  Mood.sad: Image.asset('assets/images/sad.png'),
  Mood.neutral: Image.asset('assets/images/neutral.png'),
  Mood.good: Image.asset('assets/images/good.png'),
  Mood.happy: Image.asset('assets/images/happy.png'),
};


class UserState {
  UserState({required this.title, required this.description, required this.date, required this.mood}) : id = uuid.v4();

  final String id;
  final String title;
  final String description;
  final DateTime date;
  final Mood mood;

  get formattedDate {
    return formatter.format(date);
  }
}