import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/services/events/ticket_details.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //log.d("IT is in build ${snapshot.data!.length}");
    return FutureBuilder(
      future: _eventService.getPastEvent(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          //return const Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasData) {
              final Iterable<TicketDetails?> allTickets = snapshot.data!;
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * 0.026, 0, 0),
                  child: ListView(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allTickets.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                            child: TicketCard(
                              ticketDetails: allTickets.elementAt(index)!,
                            ),
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
