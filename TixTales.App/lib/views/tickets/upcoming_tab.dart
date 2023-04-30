import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';

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
    return const Placeholder();
  }
}
