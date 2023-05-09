import 'package:flutter/material.dart';

@immutable
abstract class EventTicketState {
  const EventTicketState();
}

//Possible states for event ticket page
class EventTicketStateLoaded extends EventTicketState {}

class EvenTicketStateUnloaded extends EventTicketState {}
