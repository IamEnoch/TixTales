import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class SingleEventPage extends StatefulWidget {
  const SingleEventPage({super.key});

  @override
  State<SingleEventPage> createState() => _SingleEventPageState();
}

class _SingleEventPageState extends State<SingleEventPage> {
  @override
  Widget build(BuildContext context) {
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
                    '€ 35.00 - € 75.00',
                    style: AppResources.appStyles.textStyles.bodyDefault
                        .copyWith(color: AppResources.appColors.typographyDark),
                  )
                ],
              ),
              const SizedBox(
                width: 65,
              ),
              SizedBox(
                width: 189,
                height: 44,
                child: OutlinedButton(
                  onPressed: () {},
                  style: AppResources.buttonStyles.buttonStyle(
                    backgroundColor: AppResources.appColors.globalPrimary,
                  ),
                  child: Text(
                    'Tickets',
                    style: AppResources
                        .appStyles.textStyles.componentsButtonDefault
                        .copyWith(
                      color: AppResources.appColors.typographyGlobalLight,
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
                    alignment: Alignment.bottomLeft,
                    fit: StackFit.passthrough,
                    children: [
                      const Image(
                        image: AssetImage(AppAssets.testImage),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            9, 0, 15, 17.5),
                        width: MediaQuery.of(context).size.width,
                        child: Row(
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
                            const SizedBox(
                              width: 308,
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
                              iconSize: 24,
                            ),
                            const SizedBox(
                              width: 17,
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
                              iconSize: 26,
                            ),
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
                        'La Rosalia',
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
                                  'Mon, Apr 18 · 21:00 Pm',
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
                                  '21:00 Pm - 23:30 Pm',
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
                                  'Palau Sant Jordi',
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
                                  'Passeig Olímpic, 5-7, 08038 Barcelona',
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
                        height: 130,
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppResources.appStyles.textStyles.bodySmall
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                        ],
                      ),

                      //test
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppResources.appStyles.textStyles.bodySmall
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                        ],
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppResources.appStyles.textStyles.bodySmall
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                        ],
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppResources.appStyles.textStyles.bodySmall
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                        ],
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
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                            style: AppResources.appStyles.textStyles.bodySmall
                                .copyWith(
                              color: AppResources.appColors.typographyDark,
                            ),
                          ),
                        ],
                      ),
                      //end
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