import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/services/users/firebase/users_service.dart';
import 'package:tix_tales/services/users/ticket.dart';
import 'package:tix_tales/widgets/ticket_card.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  late final UserService _userService;
  late final EventsService _eventService;
  late Future<Iterable<Ticket>>? eventTickets;
  final log = logger(UpcomingTab);

  // AppEvent checkMethod()  {
  //   return   _eventService.getEvent(eventId: '10').whenComplete(() => null);
  // }

  @override
  void initState() {
    _userService = UserService();
    _eventService = EventsService();

    eventTickets = _userService.getTickets();
    var check = _eventService.getEvent(eventId: '10');

    log.d("the event is $check");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //log.d("IT is in build ${snapshot.data!.length}");
    return FutureBuilder(
      future: eventTickets,
      builder: (context, AsyncSnapshot<Iterable<Ticket>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          //return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              final Iterable<Ticket> allTickets = snapshot.data!;
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * 0.026, 0, 0),
                  child: ListView(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final Iterable<Ticket>? allTickets = snapshot.data;
                          return FutureBuilder(
                            future: _eventService.getEvent(
                                eventId: allTickets!.elementAt(index).eventId!),
                            builder:
                                (context, AsyncSnapshot<AppEvent?> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                case ConnectionState.done:
                                  AppEvent? eventData = snapshot.data;
                                  log.e('the event data is $eventData');
                                  if (eventData == null) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 10),
                                      child: TicketCard(
                                        eventTicket:
                                            allTickets.elementAt(index),
                                        event: eventData,
                                      ),
                                    );
                                  }
                                default:
                                  return const CircularProgressIndicator();
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
