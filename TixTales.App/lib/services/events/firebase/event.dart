import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart' show DateFormat;

// List<T> convertDynamicObjectToListOfObjects<T>(
//     dynamic object, T Function(Map<String, dynamic>) constructor) {
//   List<T> list = [];

//   object.forEach((key, value) {
//     T item = constructor(value);
//     list.add(item);
//   });

//   return list;
// }

List<T> convertDynamicListToListOfObjects<T>(
    List<dynamic> dynamicList, T Function(dynamic) f) {
  return List<T>.generate(dynamicList.length, (index) => f(dynamicList[index]));
}

//to desire date
String desiredDate(String inputDateString) {
  DateTime dateTime = DateTime.parse(inputDateString);
  String dateString = DateFormat('E, MMM d · hh.mm a').format(dateTime);
  return dateString;
}

class Event {
  final String? documentId;
  final String? eventId;
  final String? eventName;
  final String? location;
  final String? thumbNail;
  final String? about;
  final String? eventDate;
  final List<PriceCategory>? price;

  Event({
    required this.documentId,
    required this.eventId,
    required this.eventName,
    required this.location,
    required this.thumbNail,
    required this.about,
    required this.eventDate,
    required this.price,
  });

  //Creating and instance of cloudnote from from snapshot
  factory Event.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    List<dynamic> dynamicList = snapshot.data()['price'];
    List<PriceCategory> myPriceList =
        convertDynamicListToListOfObjects<PriceCategory>(
            dynamicList, (value) => PriceCategory.fromMap(value));

    String changedDate = desiredDate(snapshot.data()['eventDate']);

    return Event(
      documentId: snapshot.id,
      eventId: snapshot.data()['eventId'],
      eventName: snapshot.data()['eventName'],
      location: snapshot.data()['location'],
      thumbNail: snapshot.data()['thumbNail'],
      about: snapshot.data()['about'],
      eventDate: changedDate,
      price: myPriceList,
    );
  }
}

class PriceCategory {
  String? fee;
  String? price;
  String? salesEnd;
  String? ticketType;
  PriceCategory({
    required this.fee,
    required this.price,
    required this.salesEnd,
    required this.ticketType,
  });

  factory PriceCategory.fromMap(Map<String, dynamic> map) {
    return PriceCategory(
      fee: map['fee'],
      price: map['price'],
      salesEnd: map['salesEnd'],
      ticketType: map['ticketType'],
    );
  }
}
