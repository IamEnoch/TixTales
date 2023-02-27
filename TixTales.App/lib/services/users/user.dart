import 'package:cloud_firestore/cloud_firestore.dart';

List<T> convertDynamicListToListOfObjects<T>(
    List<dynamic> dynamicList, T Function(dynamic) f) {
  return List<T>.generate(dynamicList.length, (index) => f(dynamicList[index]));
}

//User model
class User {
  final String documentId;
  final String userId;
  final List<Ticket> tickets;
  final List<Favourite> favourites;

  User({
    required this.documentId,
    required this.userId,
    required this.tickets,
    required this.favourites,
  });

  factory User.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    List<dynamic> dynamicTicketList = snapshot.data()['tickets'];
    List<dynamic> dynamicFavouriteList = snapshot.data()['favourites'];

    //Generate a list of tickets
    List<Ticket> myTicketsList = convertDynamicListToListOfObjects<Ticket>(
        dynamicTicketList, (value) => Ticket.fromMap(value));

    //Generate a list of favourites
    List<Favourite> myFavouritesList = convertDynamicListToListOfObjects(
        dynamicFavouriteList, (value) => Favourite.fromMap(value));

    return User(
      documentId: snapshot.data()['documentId'],
      userId: snapshot.data()['userId'],
      tickets: myTicketsList,
      favourites: myFavouritesList,
    );
  }
}

//Ticket model
class Ticket {
  final String? eventId;
  final String? ticketsBought;

  Ticket({
    required this.eventId,
    required this.ticketsBought,
  });

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      eventId: map['eventId'],
      ticketsBought: map['ticketsBought'],
    );
  }
}

//Favourite model
class Favourite {
  final String? eventId;

  Favourite({required this.eventId});

  factory Favourite.fromMap(Map<String, dynamic> map) {
    return Favourite(
      eventId: map['eventId'],
    );
  }
}
