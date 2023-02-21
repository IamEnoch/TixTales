import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(36.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find evnts in',
                style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                  color: AppResources.appColors.typographyGrey,
                ),
              ),
              const SizedBox(height: 8.5),
              SizedBox(
                height: 20,
                child: Row(children: [
                  Image.asset(AppAssets.mapPinIcon),
                  const SizedBox(width: 5),
                  DropdownButton<String>(
                    underline: Container(),
                    style: AppResources.appStyles.textStyles.headineH6.copyWith(
                      color: AppResources.appColors.typographyDark,
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
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {},
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      const Image(
                        image: AssetImage(AppAssets.testImage),
                        fit: BoxFit.scaleDown,
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            11.7, 12.7, 13, 13.6),
                        height: 112,
                        color: AppResources.appColors.globalGrey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('time',
                                style: AppResources
                                    .appStyles.textStyles.bodySmall),
                            const SizedBox(height: 6),
                            Text('Name',
                                style: AppResources
                                    .appStyles.textStyles.bodyDefaultBold),
                            const SizedBox(height: 6),
                            Text('Time',
                                style: AppResources
                                    .appStyles.textStyles.bodySmall),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite),
                                  color: AppResources.appColors.typographyGrey,
                                  padding: const EdgeInsets.all(0),
                                  iconSize: 10,
                                ),
                                const SizedBox(width: 17),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.share),
                                  color: AppResources.appColors.typographyGrey,
                                  iconSize: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 360,
                    height: 84,
                    child: Row(
                      children: [
                        Ink.image(
                          image: const AssetImage(AppAssets.testImage),
                          width: 89,
                          height: 84,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 5.53, 0, 5.53),
                          child: Container(
                            alignment: Alignment.topLeft,
                            width: 185,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("data"),
                                Text("data"),
                                Text("data")
                              ],
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                              color: AppResources.appColors.typographyGrey,
                              padding: const EdgeInsets.all(0),
                              iconSize: 18,
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                              color: AppResources.appColors.typographyGrey,
                              iconSize: 18,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
