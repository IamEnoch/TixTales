abstract class EventTicketEvent {
  const EventTicketEvent();
}

//Events that can be raised in the event ticket bloc
class EventTicketEventGetPastTickets extends EventTicketEvent {
  const EventTicketEventGetPastTickets();
}

//Events that can be raised in the event ticket bloc
class EventTicketEventGetUpcomingTickets extends EventTicketEvent {
  const EventTicketEventGetUpcomingTickets();
}
