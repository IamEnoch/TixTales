import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tix_tales/services/users/favourite.dart';
import 'package:tix_tales/services/users/ticket.dart';

List<T> convertDynamicListToListOfObjects<T>(
    List<dynamic> dynamicList, T Function(dynamic) f) {
  return List<T>.generate(dynamicList.length, (index) => f(dynamicList[index]));
}

//User model
class AppUser {
  final String documentId;
  final String userId;
  final List<Ticket> tickets;
  final List<Favourite> favourites;

  const AppUser({
    required this.documentId,
    required this.userId,
    required this.tickets,
    required this.favourites,
  });

  factory AppUser.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    List<dynamic> dynamicTicketList = snapshot.data()['tickets'];
    List<dynamic> dynamicFavouriteList = snapshot.data()['favourites'];

    //Generate a list of tickets
    List<Ticket> myTicketsList = convertDynamicListToListOfObjects<Ticket>(
        dynamicTicketList, (value) => Ticket.fromMap(value));

    //Generate a list of favourites
    List<Favourite> myFavouritesList = convertDynamicListToListOfObjects(
        dynamicFavouriteList, (value) => Favourite.fromMap(value));

    return AppUser(
      documentId: snapshot.data()['documentId'],
      userId: snapshot.data()['userId'],
      tickets: myTicketsList,
      favourites: myFavouritesList,
    );
  }
}
