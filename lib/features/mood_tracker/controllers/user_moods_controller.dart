import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freud/features/mood_tracker/models/user_mood.dart';


class UserMoodsController{
  var userId = FirebaseAuth.instance.currentUser!.uid;

  Future addNewUserMood(UserMood userMood) async{
    await FirebaseFirestore.instance.collection('User Moods').add({
      'userId': userId,
      'description': userMood.description,
      'date': userMood.date,
      'mood': userMood.mood.toJson(),
    });
  }

}