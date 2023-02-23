import 'package:flutter/material.dart';
import 'package:tix_tales/src/Constants/all_constant_imports.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';
import 'package:tix_tales/src/Constants/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue;
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: const EdgeInsets.all(15), children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 24.67,
              ),
              Text(
                'Find evnts in',
                style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                  color: AppResources.appColors.typographyGrey,
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
                  child: SizedBox(
                    height: 230,
                    child: Column(
                      //alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: ClipRect(
                            child: Ink.image(
                              alignment: Alignment.topCenter,
                              image: const AssetImage(AppAssets.testImage),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              11.7, 12.7, 14, 13.6),
                          child: Row(
                            //color: AppResources.appColors.globalGrey,
                            children: [
                              Container(
                                width: 288,
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Thu, Apr 19 · 20.00 Pm',
                                        style: AppResources
                                            .appStyles.textStyles.bodySmall),
                                    const SizedBox(height: 6),
                                    Text(items[0],
                                        style: AppResources.appStyles.textStyles
                                            .bodyDefaultBold),
                                    const SizedBox(height: 6),
                                    Text('Razzmatazz',
                                        style: AppResources
                                            .appStyles.textStyles.bodySmall),
                                    //here
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      alignment: Alignment.center,
                                      constraints: const BoxConstraints(
                                          maxHeight: 25, maxWidth: 25),
                                      onPressed: () {},
                                      icon: Image.asset(
                                        AppAssets.heartIcon,
                                        color: AppResources.appColors.iconGrey,
                                      ),
                                      color:
                                          AppResources.appColors.typographyGrey,
                                      padding: const EdgeInsets.all(0),
                                      iconSize: 20,
                                    ),
                                    const SizedBox(width: 27),
                                    IconButton(
                                      alignment: Alignment.center,
                                      constraints: const BoxConstraints(
                                          maxHeight: 25, maxWidth: 25),
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {},
                                      icon: Image.asset(
                                        AppAssets.shareIcon,
                                        color: AppResources.appColors.iconGrey,
                                        width: 24.0,
                                        height: 26.3,
                                      ),
                                      color:
                                          AppResources.appColors.typographyGrey,
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
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: items.length - 1,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: MySmallCard(eventName: items[index + 1]));
                  })
            ],
          ),
        ]),
      ),
    );
  }
}

class MySmallCard extends StatelessWidget {
  final String eventName;
  const MySmallCard({super.key, required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(singleEventPage);
        },
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
                padding: const EdgeInsets.fromLTRB(10, 5.53, 4, 5.53),
                child: Container(
                  alignment: Alignment.topLeft,
                  width: 185,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Thu, Apr 19 · 20.00 Pm",
                        style: AppResources.appStyles.textStyles.bodySmall,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        eventName,
                        style:
                            AppResources.appStyles.textStyles.bodyDefaultBold,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Text(
                        "Razzmatazz",
                        style: AppResources.appStyles.textStyles.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    alignment: Alignment.center,
                    constraints:
                        const BoxConstraints(maxHeight: 25, maxWidth: 25),
                    onPressed: () {},
                    icon: Image.asset(
                      AppAssets.heartIcon,
                      color: AppResources.appColors.iconGrey,
                    ),
                    color: AppResources.appColors.typographyGrey,
                    padding: const EdgeInsets.all(0),
                    iconSize: 20,
                  ),
                  const SizedBox(width: 27),
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
            ],
          ),
        ),
      ),
    );
  }
}
