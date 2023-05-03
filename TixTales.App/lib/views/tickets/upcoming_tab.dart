import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/widgets/ticket_card.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  State<UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  late final EventsService _eventsService;
  final log = logger(UpcomingTab);

  @override
  void initState() {
    _eventsService = EventsService();
    log.d("IT is ${_eventsService.events}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log.d("IT is ${_eventsService.events}");
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            0, MediaQuery.of(context).size.height * 0.026, 0, 0),
        child: ListView(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: TicketCard(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
