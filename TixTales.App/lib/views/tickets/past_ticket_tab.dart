import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/eventTickets/bloc/event_ticket_bloc.dart';
import 'package:tix_tales/services/eventTickets/bloc/event_ticket_event.dart';
import 'package:tix_tales/services/eventTickets/bloc/event_ticket_state.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/services/events/ticket_details.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/widgets/ticket_card.dart';

class PastTicketsTab extends StatelessWidget {
  const PastTicketsTab({super.key});

  Widget build(BuildContext context) {
    BlocProvider.of<EventTicketBloc>(context).add(
        const EventTicketEventGetPastTickets()); // Use BlocProvider to raise the event
    return BlocBuilder<EventTicketBloc, EventTicketState>(
      builder: (context, state) {
        if (state is EventTicketStateLoaded) {
          var _eventService = EventsService();
          return FutureBuilder(
            future: _eventService.getPastEvents(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final Iterable<TicketDetails?> allTickets = snapshot.data!;
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0,
                            MediaQuery.of(context).size.height * 0.026, 0, 0),
                        child: ListView(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allTickets.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 10),
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
        } else {
          return Scaffold(
              body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Image.asset(AppAssets.ticketIconBig),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text('No Past tickets',
                    style: AppResources.appStyles.textStyles.bodyDefault),
              ],
            ),
          ));
        }
      },
    );
  }
}
