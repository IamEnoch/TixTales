import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/services/events/firebase/events_exceptions.dart';

class EventsService {
  final log = logger(EventsService);
  final events = FirebaseFirestore.instance.collection('events');

  //snapshots updates all the changes that are happening live from the notes
  Stream<Iterable<AppEvent>> allEvents() {
    return events.snapshots().map(
          (event) => event.docs.map(
            (doc) => AppEvent.fromSnapshot(doc),
          ),
        );
  }

  //getting events by user
  Future<Iterable<AppEvent>> getEvents() async {
    try {
      return await events
          .get()
          .then((value) => value.docs.map((doc) => AppEvent.fromSnapshot(doc)));
    } catch (e) {
      throw CouldNotGetAllEventsException();
    }
  }

  //getting events by user
  Future<AppEvent?> getEvent({
    required String eventId,
  }) async {
    try {
      AppEvent myEvent = AppEvent();
      var check = await events
          .where('eventId' == eventId)
          .get()
          .then((value) => value.docs.map((doc) => AppEvent.fromSnapshot(doc)));

      log.d('Check 2 issue $check');

      for (var element in check) {
        if (element.eventId == eventId) {
          myEvent = element;
          log.d(myEvent);
          return myEvent;
        }
      }
    } catch (e) {
      log.e('The error caught is $e');
      throw CouldNotGetAllEventsException();
    }
  }

  //make event service singleton
  static final EventsService _shared = EventsService._internalInstance();
  EventsService._internalInstance();

  factory EventsService() => _shared;
}
