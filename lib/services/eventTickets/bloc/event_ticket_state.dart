import 'package:flutter/material.dart';

@immutable
abstract class EventTicketState {
  const EventTicketState();
}

//Possible states for event ticket page
class EventTicketStateLoaded extends EventTicketState {
  const EventTicketStateLoaded();
}

class EvenTicketStateUnloaded extends EventTicketState {
  const EvenTicketStateUnloaded();
}
