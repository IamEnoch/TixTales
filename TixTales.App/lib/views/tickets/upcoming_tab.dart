import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

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
      child: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Image.asset(
                  AppAssets.greenTicketIcon,
                  width: 100,
                  height: 200,
                ),
                Container(
                  child: Column(
                    children: const [
                      Text('La rosalia'),
                      Text('Date'),
                    ],
                  ),
                ),
                Ink.image(
                  alignment: Alignment.centerRight,
                  image: const NetworkImage(
                      "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                  width: 89,
                  height: 84,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
