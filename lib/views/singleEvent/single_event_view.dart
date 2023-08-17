import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';

class SingleEventPage extends StatelessWidget {
  const SingleEventPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Read the arguments that contains the event
    final AppEvent event =
        ModalRoute.of(context)?.settings.arguments as AppEvent;

    final screenHeight = MediaQuery.of(context).size.height;
    const bottomSheetHeight = 87.0;
    final maxScrollViewHeight = screenHeight - bottomSheetHeight;

    return Expanded(
      child: Scaffold(
        bottomSheet: Container(
          padding: const EdgeInsetsDirectional.fromSTEB(15, 20.5, 15, 17.5),
          alignment: Alignment.topLeft,
          color: AppResources.appColors.globalGrey,
          height: bottomSheetHeight,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Price',
                    style: AppResources.appStyles.textStyles.bodyDefaultBold
                        .copyWith(color: AppResources.appColors.typographyDark),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    event.priceRange!,
                    style: AppResources.appStyles.textStyles.bodyDefault
                        .copyWith(color: AppResources.appColors.typographyDark),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.16,
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.48,
                  height: MediaQuery.of(context).size.width * 0.39,
                  child: OutlinedButton(
                    //navigate to buy ticket page
                    onPressed: () {
                      Navigator.pushNamed(context, buyTicketPage,
                          arguments: event.price!);
                    },
                    style: AppResources.buttonStyles.buttonStyle(
                      backgroundColor: AppResources.appColors.globalPrimary,
                    ),
                    child: Text(
                      'Ticket',
                      style: AppResources
                          .appStyles.textStyles.componentsButtonDefault
                          .copyWith(
                        color: AppResources.appColors.typographyGlobalLight,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        backgroundColor: AppResources.appColors.typographyGlobalLight,
        body: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxScrollViewHeight),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    fit: StackFit.passthrough,
                    children: [
                      Image(
                        image: NetworkImage(event.thumbNail!),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            15, 0, 6, 17.5),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //back button icon
                            IconButton(
                              constraints: const BoxConstraints(
                                  maxHeight: 25, maxWidth: 25),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Image.asset(
                                AppAssets.leftArrowIcon,
                                color: AppResources
                                    .appColors.typographyGlobalLight,
                                width: 24.0,
                                height: 26.3,
                              ),
                              iconSize: 24,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.73,
                            ),
                            //favourite icon button
                            IconButton(
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                  maxHeight: 25, maxWidth: 25),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Image.asset(
                                AppAssets.heartIcon,
                                color: AppResources
                                    .appColors.typographyGlobalLight,
                                width: 24.0,
                                height: 26.3,
                              ),
                              iconSize: 21,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            //share icon button
                            IconButton(
                              alignment: Alignment.center,
                              constraints: const BoxConstraints(
                                  maxHeight: 25, maxWidth: 25),
                              padding: const EdgeInsets.all(0),
                              onPressed: () {},
                              icon: Image.asset(
                                AppAssets.shareIcon,
                                color: AppResources
                                    .appColors.typographyGlobalLight,
                                width: 24.0,
                                height: 26.3,
                              ),
                              iconSize: 21,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.54,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.eventName!,
                        style: AppResources.appStyles.textStyles.headineH4
                            .copyWith(
                          color: AppResources.appColors.globalDark,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.calendarIcon,
                            color: AppResources.appColors.globalDark,
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 23, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.eventDate!,
                                  style: AppResources
                                      .appStyles.textStyles.bodyDefaultBold
                                      .copyWith(
                                    color:
                                        AppResources.appColors.typographyDark,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  event.eventDate!,
                                  style: AppResources
                                      .appStyles.textStyles.bodySmall
                                      .copyWith(
                                    color:
                                        AppResources.appColors.typographyDark,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.mapPinIcon,
                            color: AppResources.appColors.globalDark,
                            width: 18,
                            height: 18,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 23, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.location!,
                                  style: AppResources
                                      .appStyles.textStyles.bodyDefaultBold
                                      .copyWith(
                                    color:
                                        AppResources.appColors.typographyDark,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  event.location!,
                                  style: AppResources
                                      .appStyles.textStyles.bodySmall
                                      .copyWith(
                                    color:
                                        AppResources.appColors.typographyDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 35.1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: AppResources
                                .appStyles.textStyles.bodyDefaultBold
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            event.about!,
                            style: AppResources.appStyles.textStyles.bodySmall
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32.5,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
