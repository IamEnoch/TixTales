import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/services/events/firebase/events_exceptions.dart';
import 'package:tix_tales/services/events/ticket_details.dart';
import 'package:tix_tales/services/users/firebase/users_service.dart';

class EventsService {
  final log = logger(EventsService);
  final _userService = UserService();
  final events = FirebaseFirestore.instance.collection('events');

  //snapshots updates all the changes that are happening live from the notes
  Stream<Iterable<AppEvent>> allEvents() {
    return events.snapshots().map(
          (event) => event.docs
              .map(
                (doc) => AppEvent.fromSnapshot(doc),
              )
              .where((element) => DateFormat('E, MMM d · hh.mm a . y')
                  .parse(element.eventDate!)
                  .isAfter(DateTime.now())),
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
  Future<Iterable<TicketDetails?>> getPastEvents() async {
    try {
      //get all bought tickets
      var tickets = await _userService.getTickets();

      List<TicketDetails> myEvent = [];
      var myEvents = await events
          .get()
          .then((value) => value.docs.map((doc) => AppEvent.fromSnapshot(doc)));

      log.d('Check 2 issue $myEvents');

      //DateFormat('E, MMM d · hh.mm a').parse(element.eventDate!).isAfter(DateTime.now())
      for (var singleEvent in myEvents) {
        for (var ticket in tickets) {
          if (singleEvent.eventId == ticket.eventId &&
              DateFormat('E, MMM d · hh.mm a . y')
                  .parse(singleEvent.eventDate!)
                  .isBefore(DateTime.now())) {
            var check = TicketDetails(
                eventName: singleEvent.eventName,
                eventDate: singleEvent.eventDate,
                ticketsBought: ticket.ticketsBought,
                thumbnail: singleEvent.thumbNail);

            log.d(myEvent);
            myEvent.add(check);
          }
        }
      }
      return myEvent;
    } catch (e) {
      log.e('The error caught is $e');
      throw CouldNotGetAllEventsException();
    }
  }

  //getting events by user
  Future<Iterable<TicketDetails?>> getUpcomingEvents() async {
    try {
      //get all bought tickets
      var tickets = await _userService.getTickets();

      List<TicketDetails> myEvents = [];
      var responseEvents = await events
          .get()
          .then((value) => value.docs.map((doc) => AppEvent.fromSnapshot(doc)));

      log.d('Check 2 issue $responseEvents');

      //DateFormat('E, MMM d · hh.mm a').parse(element.eventDate!).isAfter(DateTime.now())
      for (var singleEvent in responseEvents) {
        for (var ticket in tickets) {
          if (singleEvent.eventId == ticket.eventId &&
              DateFormat('E, MMM d · hh.mm a . y')
                  .parse(singleEvent.eventDate!)
                  .isAfter(DateTime.now())) {
            var check = TicketDetails(
                eventName: singleEvent.eventName,
                eventDate: singleEvent.eventDate,
                ticketsBought: ticket.ticketsBought,
                thumbnail: singleEvent.thumbNail);

            log.d(myEvents);
            myEvents.add(check);
          }
        }
      }
      return myEvents;
    } catch (e) {
      log.e('The error caught is $e');
      throw CouldNotGetAllEventsException();
    }
  }

  //make event service singleton
  // static final EventsService _shared = EventsService._internalInstance();
  // EventsService._internalInstance();

  // factory EventsService() => _shared;
}
