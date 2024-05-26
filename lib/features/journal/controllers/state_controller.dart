import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freud/features/journal/models/user_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StateController {
  var userId = FirebaseAuth.instance.currentUser!.uid;

  final CollectionReference _userStatesCollection =
      FirebaseFirestore.instance.collection('User States');

  Future addNewState(UserState state) async {
    await FirebaseFirestore.instance.collection('User States').add({
      'userId': userId,
      'title': state.title,
      'description': state.description,
      'date': state.date,
      'mood': state.mood.toJson(),
    });
  }

  Stream<List<UserState>> getUserStates() {
    return _userStatesCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((query) => query.docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return UserState(
                title: data['title'],
                description: data['description'],
                date: (data['date'] as Timestamp).toDate(),
                mood: Mood.values.byName(data['mood']),
              );
            }).toList());
  }
}
