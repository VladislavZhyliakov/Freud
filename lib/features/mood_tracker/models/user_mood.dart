import 'package:flutter/material.dart';

class UserMood {
  const UserMood(
      {required this.description, required this.date, required this.mood});

  final String description;
  final DateTime date;
  final Mood mood;
}

enum Mood {
  verysad,
  sad,
  neutral,
  good,
  happy;

  String toJson() => name;
  static Mood fromJson(String json) => Mood.values.byName(json);
}

final moodIcons = {
  Mood.verysad: Image.asset('assets/images/very_sad.png'),
  Mood.sad: Image.asset('assets/images/sad.png'),
  Mood.neutral: Image.asset('assets/images/neutral.png'),
  Mood.good: Image.asset('assets/images/good.png'),
  Mood.happy: Image.asset('assets/images/happy.png'),
};
