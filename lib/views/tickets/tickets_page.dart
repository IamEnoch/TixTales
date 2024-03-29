import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tix_tales/services/eventTickets/bloc/event_ticket_bloc.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/views/tickets/past_ticket_tab.dart';
import 'package:tix_tales/views/tickets/upcoming_tab.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage>
    with SingleTickerProviderStateMixin {
  //declare the tab controller
  late TabController _tabController;

  //delcare the tab controller
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventTicketBloc(EventsService()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppResources.appColors.globalPrimary,
          title: const Text(
            'My app bar',
          ),
          bottom: TabBar(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height * 0.03, 0, 0),
            labelStyle:
                AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
              color: AppResources.appColors.typographyGlobalLight,
            ),
            unselectedLabelStyle:
                AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
              color: AppResources.appColors.globalGrey,
            ),
            controller: _tabController,
            tabs: const [
              Tab(
                text: 'Upcoming',
              ),
              Tab(text: 'Past Tickets'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            // Add your content for Tab 1 here
            UpcomingTab(),
            // Add your content for Tab 2 here
            PastTicketsTab(),
          ],
        ),
      ),
    );
  }
}
