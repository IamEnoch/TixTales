import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/eventTickets/bloc/event_ticket_event.dart';
import 'package:tix_tales/services/eventTickets/bloc/event_ticket_state.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/services/events/ticket_details.dart';

class EventTicketBloc extends Bloc<EventTicketEvent, EventTicketState> {
  //setup bloc and initial state
  EventTicketBloc(EventsService eventsService)
      : super(const EvenTicketStateUnloaded()) {
    //on event => get past tickets
    on<EventTicketEventGetPastTickets>((event, emit) async {
      Iterable<TicketDetails?> pastTickets =
          await eventsService.getPastEvents();
      if (pastTickets.isEmpty) {
        emit(const EvenTicketStateUnloaded());
      } else {
        emit(const EventTicketStateLoaded());
      }
    });

    //on event => get upcoming tickets
    on<EventTicketEventGetUpcomingTickets>((event, emit) async {
      Iterable<TicketDetails?> upcomingTickets =
          await eventsService.getUpcomingEvents();
      if (upcomingTickets.isEmpty) {
        emit(const EvenTicketStateUnloaded());
      } else {
        emit(const EventTicketStateLoaded());
      }
    });
  }
}
