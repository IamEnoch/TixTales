import 'package:flutter/material.dart';
import 'package:tix_tales/services/events/ticket_details.dart';
import 'package:tix_tales/src/Constants/app_assets.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class TicketCard extends StatefulWidget {
  final TicketDetails ticketDetails;
  const TicketCard({
    super.key,
    required this.ticketDetails,
  });

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.026),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //SizedBox(width: MediaQuery.of(context).size.width * 0.026),
                    Image.asset(
                      AppAssets.greenTicketIcon,
                      width: 31,
                      height: 31,
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.037),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.ticketDetails.eventName!,
                              style: AppResources
                                  .appStyles.textStyles.bodyDefaultBold),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),
                          Text(widget.ticketDetails.eventDate!,
                              style:
                                  AppResources.appStyles.textStyles.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.015),
                Text('${widget.ticketDetails.ticketsBought} tickets',
                    style: AppResources.appStyles.textStyles.bodySmall),
              ],
            ),
          ),
          Expanded(
            child: Ink.image(
              image: NetworkImage(widget.ticketDetails.thumbnail!),
              width: 10,
              height: MediaQuery.of(context).size.height * 0.125,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
