import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tix_tales/services/events/firebase/event.dart';
import 'package:tix_tales/services/events/firebase/events_exceptions.dart';

class EventsService {
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
  Future<Iterable<AppEvent>> getNotes() async {
    try {
      return await events
          .get()
          .then((value) => value.docs.map((doc) => AppEvent.fromSnapshot(doc)));
    } catch (e) {
      throw CouldNotGetAllEventsException();
    }
  }

  //make event service singleton
  static final EventsService _shared = EventsService._internalInstance();
  EventsService._internalInstance();

  factory EventsService() => _shared;
}
