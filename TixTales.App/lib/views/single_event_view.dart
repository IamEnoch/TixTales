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
    return Scaffold(
      backgroundColor: AppResources.appColors.typographyGlobalLight,
      body: Column(
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
                  margin: const EdgeInsetsDirectional.fromSTEB(9, 0, 15, 17.5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      //back button icon
                      IconButton(
                        constraints:
                            const BoxConstraints(maxHeight: 25, maxWidth: 25),
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset(
                          AppAssets.leftArrowIcon,
                          color: AppResources.appColors.typographyGlobalLight,
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
                        constraints:
                            const BoxConstraints(maxHeight: 25, maxWidth: 25),
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image.asset(
                          AppAssets.heartIcon,
                          color: AppResources.appColors.typographyGlobalLight,
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
                        constraints:
                            const BoxConstraints(maxHeight: 25, maxWidth: 25),
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Image.asset(
                          AppAssets.shareIcon,
                          color: AppResources.appColors.typographyGlobalLight,
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
        ],
      ),
    );
  }
}
