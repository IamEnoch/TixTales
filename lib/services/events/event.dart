import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import 'package:tix_tales/services/events/priceCategory.dart';

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

//Method that get the price-range of the event
List<String> priceRangeList(List<PriceCategory> prices) {
  List<String> filteredPrices = [];

  for (var element in prices) {
    filteredPrices.add(element.price!);
  }
  return filteredPrices;
}

//Method the generates a formatted string of the price range
String getPriceRange(
  List<PriceCategory> prices,
) {
  // create a NumberFormat instance for currency formatting
  NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'es_ES', symbol: '€');

  List<String> priceRangeListString = priceRangeList(prices);
  List<double> doublePriceRangeList = [];

  for (String element in priceRangeListString) {
    doublePriceRangeList.add(currencyFormatter.parse(element).toDouble());
  }

  return "€ ${doublePriceRangeList.reduce(min)} - € ${doublePriceRangeList.reduce(max)}";
}

//App event model
class AppEvent {
  final String? documentId;
  final String? eventId;
  final String? eventName;
  final String? location;
  final String? thumbNail;
  final String? about;
  final String? eventDate;
  final String? priceRange;
  final List<PriceCategory>? price;

  AppEvent({
    this.documentId,
    this.eventId,
    this.eventName,
    this.location,
    this.thumbNail,
    this.about,
    this.eventDate,
    this.priceRange,
    this.price,
  });

  //Creating and instance of cloudnote from from snapshot
  factory AppEvent.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
    List<dynamic> dynamicList = snapshot.data()['price'];
    List<PriceCategory> myPriceList =
        convertDynamicListToListOfObjects<PriceCategory>(
            dynamicList, (value) => PriceCategory.fromMap(value));

    String changedDate = desiredDate(snapshot.data()['eventDate']);
    String myPriceRange = getPriceRange(myPriceList);

    return AppEvent(
      documentId: snapshot.id,
      eventId: snapshot.data()['eventId'],
      eventName: snapshot.data()['eventName'],
      location: snapshot.data()['location'],
      thumbNail: snapshot.data()['thumbnail'],
      about: snapshot.data()['about'],
      eventDate: changedDate,
      priceRange: myPriceRange,
      price: myPriceList,
    );
  }
}
