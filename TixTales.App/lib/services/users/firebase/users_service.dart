import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/users/firebase/users_exceptions.dart';
import 'package:tix_tales/services/users/user.dart';

class UserService {
  final log = logger(UserService);
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

  //Is favourite or not method
  Future<bool> isFavourite({
    required String eventId,
  }) async {
    var check = await specificQuery();
    bool containsValueToCheck = false;

    for (var doc in check.docs) {
      // Update the document
      var documentReference =
          FirebaseFirestore.instance.collection('users').doc(doc.id);

      await documentReference.get().then(
        (DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            final info = documentSnapshot.data() as Map<String, dynamic>;
            final myfavourites = info['favourites'] as dynamic;

            myfavourites.any((favourite) => favourite['eventId'] == eventId)
                ? containsValueToCheck = true
                : containsValueToCheck = false;
          }
        },
      );
    }
    return containsValueToCheck;
  }

  //Add/remove favourite method
  Future<void> addOrRemoveFavourite({
    required String eventId,
  }) async {
    try {
      var check = await specificQuery();

      for (var doc in check.docs) {
        // Update the document
        var documentReference =
            FirebaseFirestore.instance.collection('users').doc(doc.id);

        if (await isFavourite(eventId: eventId)) {
          documentReference
              .update({
                'favourites': FieldValue.arrayRemove([
                  {'eventId': eventId}
                ]),
              })
              .then((value) => log.d("Document updated. Item removed"))
              .catchError(
                  (error) => log.d("Failed to update document: $error"));
        } else {
          documentReference
              .update({
                'favourites': FieldValue.arrayUnion([
                  {'eventId': eventId}
                ]),
              })
              .then((value) => log.d("Document updated. Item added"))
              .catchError(
                  (error) => log.d("Failed to update document: $error"));
        }
      }
    } catch (e) {
      print("The error is$e");
      throw CouldNotUpdateNoteExceptions();
    }
  }

  //Update user tickets bought information
  Future<void> updateUserTicketsInfo({
    required List<Map<String, String>> ticketsInfo,
  }) async {
    try {
      print('we are about to update ticket info');
      var check = await specificQuery();
      for (var doc in check.docs) {
        // Update the document
        for (var ticketInfo in ticketsInfo) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(doc.id)
              .update({
                'tickets': FieldValue.arrayUnion([ticketInfo]),
                //'tickets': FieldValue.arrayUnion([ticket])
              })
              .then((value) => log.d("Document Updated"))
              .catchError(
                  (error) => log.d("Failed to update Document: $error"));
        }
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
