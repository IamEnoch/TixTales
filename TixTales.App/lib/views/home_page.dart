import 'package:flutter/material.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/services/events/firebase/events_service.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';
import 'package:tix_tales/widgets/event_card_small.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue;
  late final EventsService _eventsService;

  @override
  void initState() {
    _eventsService = EventsService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: StreamBuilder<Iterable<AppEvent>>(
            stream: _eventsService.allEvents(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.active:
                  if (snapshot.hasData) {
                    final Iterable<AppEvent>? allEvents = snapshot.data;
                    if (allEvents != null) {
                      print('Events: is full of info');
                      print('Events: ${allEvents.elementAt(3).eventName}');
                      return SafeArea(
                        child: ListView(
                            padding: const EdgeInsets.all(15),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 24.67,
                                  ),
                                  Text(
                                    'Find evnts in',
                                    style: AppResources
                                        .appStyles.textStyles.bodySmall
                                        .copyWith(
                                      color:
                                          AppResources.appColors.typographyGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 8.5),
                                  SizedBox(
                                    height: 20,
                                    child: Row(children: <Widget>[
                                      Image.asset(AppAssets.mapPinIcon),
                                      const SizedBox(width: 5),
                                      DropdownButton<String>(
                                        underline: Container(),
                                        style: AppResources
                                            .appStyles.textStyles.headineH6
                                            .copyWith(
                                          color: AppResources
                                              .appColors.typographyDark,
                                          fontSize: 18,
                                        ),
                                        value: selectedValue,
                                        hint: const Text('Select an item'),
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Barelona',
                                            child: Text('Barcelona'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Nairobi',
                                            child: Text('Nairobi'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Mombasa',
                                            child: Text('Mombasa'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                        },
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(height: 30.5),
                                  Text('Popular in $selectedValue'),
                                  const SizedBox(height: 19.6),
                                  Card(
                                    elevation: 2,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin: EdgeInsets.zero,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            singleEventPage,
                                            arguments: allEvents.elementAt(0));
                                      },
                                      child: SizedBox(
                                        height: 230,
                                        child: Column(
                                          //alignment: AlignmentDirectional.bottomCenter,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 120,
                                              child: ClipRect(
                                                child: Ink.image(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  image: NetworkImage(allEvents
                                                      .elementAt(0)
                                                      .thumbNail!),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                      11.7, 12.7, 14, 13.6),
                                              child: Row(
                                                //color: AppResources.appColors.globalGrey,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.701,
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            allEvents
                                                                .elementAt(0)
                                                                .eventDate!,
                                                            style: AppResources
                                                                .appStyles
                                                                .textStyles
                                                                .bodySmall),
                                                        const SizedBox(
                                                            height: 6),
                                                        Text(
                                                            allEvents
                                                                .elementAt(0)
                                                                .eventName!,
                                                            style: AppResources
                                                                .appStyles
                                                                .textStyles
                                                                .bodyDefaultBold),
                                                        const SizedBox(
                                                            height: 6),
                                                        Text(
                                                            allEvents
                                                                .elementAt(0)
                                                                .location!,
                                                            style: AppResources
                                                                .appStyles
                                                                .textStyles
                                                                .bodySmall),
                                                        //here
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 50, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        IconButton(
                                                          alignment:
                                                              Alignment.center,
                                                          constraints:
                                                              const BoxConstraints(
                                                                  maxHeight: 25,
                                                                  maxWidth: 25),
                                                          onPressed: () {},
                                                          icon: Image.asset(
                                                            AppAssets.heartIcon,
                                                            color: AppResources
                                                                .appColors
                                                                .iconGrey,
                                                          ),
                                                          color: AppResources
                                                              .appColors
                                                              .typographyGrey,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          iconSize: 20,
                                                        ),
                                                        SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.055),
                                                        IconButton(
                                                          alignment:
                                                              Alignment.center,
                                                          constraints:
                                                              const BoxConstraints(
                                                                  maxHeight: 25,
                                                                  maxWidth: 25),
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                          onPressed: () {},
                                                          icon: Image.asset(
                                                            AppAssets.shareIcon,
                                                            color: AppResources
                                                                .appColors
                                                                .iconGrey,
                                                            width: 24.0,
                                                            height: 26.3,
                                                          ),
                                                          color: AppResources
                                                              .appColors
                                                              .typographyGrey,
                                                          iconSize: 20,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: allEvents.length - 1,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 20),
                                        child: MySmallCard(
                                          event: allEvents.elementAt(index + 1),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ]),
                      );
                    } else {
                      print('Events is null');
                      return const Center(child: CircularProgressIndicator());
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                default:
                  return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
