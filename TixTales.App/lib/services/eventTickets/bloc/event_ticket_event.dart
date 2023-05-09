import 'dart:html';

abstract class EventTicketEvent {
  const EventTicketEvent();
}

//Events that can be raised in the event ticket bloc
class EventTicketEventGetTickets extends EventTicketEvent {
  const EventTicketEventGetTickets();
}
