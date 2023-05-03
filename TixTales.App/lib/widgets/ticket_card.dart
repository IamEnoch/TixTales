import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tix_tales/src/Constants/app_assets.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class TicketCard extends StatefulWidget {
  const TicketCard({super.key});

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.026),
          Image.asset(
            AppAssets.greenTicketIcon,
            width: 31,
            height: 31,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.047),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('La rosalia',
                    style: AppResources.appStyles.textStyles.bodyDefaultBold),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.005,
                ),
                Text('Date',
                    style: AppResources.appStyles.textStyles.bodySmall),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.0867),
          Expanded(
            child: Ink.image(
              image: const NetworkImage(
                  "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
              width: 10,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
