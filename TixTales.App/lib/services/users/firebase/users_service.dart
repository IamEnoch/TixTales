import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tix_tales/services/users/firebase/users_exceptions.dart';
import 'package:tix_tales/services/users/user.dart';

class UserService {
  final users = FirebaseFirestore.instance.collection('users');

  Future<QuerySnapshot<Object?>> specificQuery() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
  }

  //Stream
  Stream<Iterable<AppUser>> allUsers({required String userId}) =>
      users.snapshots().map(
            (event) => event.docs
                .map((doc) => AppUser.fromSnapshot(doc))
                .where((appUser) => appUser.userId == userId),
          );

  //create a new user
  Future<AppUser> createNewUser({required String ownerUserId}) async {
    final document = await users.add({
      'userId': ownerUserId,
      'favourites': [],
    });
    final fetchedNote = await document.get();
    return AppUser(
      documentId: fetchedNote.id,
      userId: fetchedNote.get('userId'),
      tickets: fetchedNote.get('tickets'),
      favourites: fetchedNote.get('favourites'),
    );
  }

  //Updating existing user
  Future<void> updateUser({
    required Map<String, String> eventId,
  }) async {
    try {
      print('we are here');
      var check = await specificQuery();
      for (var doc in check.docs) {
        // Update the document
        FirebaseFirestore.instance
            .collection('users')
            .doc(doc.id)
            .update({
              'favourites': FieldValue.arrayUnion([eventId]),
              //'tickets': FieldValue.arrayUnion([ticket])
            })
            .then((value) => print("Document updated"))
            .catchError((error) => print("Failed to update document: $error"));
      }
    } catch (e) {
      print("The error is$e");
      throw CouldNotUpdateNoteExceptions();
    }
  }

  //Make user service singleton
  static final UserService _shared = UserService._internalInstance();
  UserService._internalInstance();

  factory UserService() => _shared;
}
