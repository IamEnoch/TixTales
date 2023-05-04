//Custom card for each event
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/services/users/favourite.dart';
import 'package:tix_tales/services/users/firebase/users_service.dart';
import 'package:tix_tales/services/users/user.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';

class MySmallCard extends StatefulWidget {
  final AppEvent event;
  const MySmallCard({
    super.key,
    required this.event,
  });

  @override
  State<MySmallCard> createState() => _MySmallCardState();
}

class _MySmallCardState extends State<MySmallCard> {
  final UserService _usersService = UserService();
  final userId = FirebaseAuth.instance.currentUser!.uid;
  bool isFavourite = false;
  var log = Logger();

  Future<bool> _method() async {
    isFavourite =
        await _usersService.isFavourite(eventId: widget.event.eventId!);

    return isFavourite;
  }

  Future<void> _toggleFavorite() async {
    if (isFavourite) {
      // Item exists, remove it
      setState(() {
        isFavourite = false;
      });
    } else {
      // Item does not exist,
      setState(() {
        isFavourite = true;
      });
    }
  }

  @override
  void initState() {
    _method().then((value) {
      setState(() {
        isFavourite = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(singleEventPage, arguments: widget.event);
        },
        child: Row(
          children: [
            Ink.image(
              image: NetworkImage(widget.event.thumbNail!),
              width: 89,
              height: 84,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5.53, 4, 5.53),
              child: Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width * 0.47,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.eventDate!,
                      style: AppResources.appStyles.textStyles.bodySmall,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.event.eventName!,
                      style: AppResources.appStyles.textStyles.bodyDefaultBold,
                    ),
                    const SizedBox(
                      height: 9,
                    ),
                    Text(
                      widget.event.location!,
                      style: AppResources.appStyles.textStyles.bodySmall,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.003,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    constraints:
                        const BoxConstraints(maxHeight: 25, maxWidth: 25),
                    onPressed: () async {
                      Favourite? favourite =
                          Favourite(eventId: widget.event.eventId!);
                      var jk = favourite.toJson();
                      await _toggleFavorite();

                      await _usersService.addOrRemoveFavourite(
                        eventId: jk['eventId']!,
                      );
                    },
                    icon: Image.asset(AppAssets.heartIcon,
                        color: isFavourite
                            ? AppResources.appColors.iconRed
                            : AppResources.appColors.iconGrey),
                    padding: const EdgeInsets.all(0),
                    iconSize: 20,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.055),
                  IconButton(
                    alignment: Alignment.center,
                    constraints:
                        const BoxConstraints(maxHeight: 25, maxWidth: 25),
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.shareIcon,
                      color: AppResources.appColors.iconGrey,
                      width: 24.0,
                      height: 26.3,
                    ),
                    color: AppResources.appColors.typographyGrey,
                    iconSize: 21,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
