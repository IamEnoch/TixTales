import 'package:flutter/material.dart';
import 'package:tix_tales/Logging/logger.dart';
import 'package:tix_tales/services/events/priceCategory.dart';
import 'package:tix_tales/src/Constants/app_assets.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class BuyTicketPage extends StatefulWidget {
  const BuyTicketPage({super.key});

  @override
  State<BuyTicketPage> createState() => _BuyTicketPageState();
}

class _BuyTicketPageState extends State<BuyTicketPage> {
  double _bottomSheetPrice = 0;
  int _numberOfTickets = 0;

  //Define a callback function that takes an int parameter (the data you want to pass back)
  //and updates the state of the bottom sheet:
  void updateBottomSheetData(double data) {
    setState(() {
      _bottomSheetPrice += data;
    });
  }

  //Define a callback function that takes an int parameter (the data you want to pass back)
  //and updates number of tickets:
  void updateNumberOfTickets(int data) {
    setState(() {
      _numberOfTickets += data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final log = logger(BuyTicketPage);
    //get event details
    final List<PriceCategory> event =
        ModalRoute.of(context)?.settings.arguments as List<PriceCategory>;

    final screenHeight = MediaQuery.of(context).size.height;
    const bottomSheetHeight = 87.0;
    final maxScrollViewHeight = screenHeight - bottomSheetHeight;

    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(15, 20.5, 15, 17.5),
        alignment: Alignment.topLeft,
        color: AppResources.appColors.globalGrey,
        height: bottomSheetHeight,
        child: Row(
          children: [
            Image.asset(
              AppAssets.shoppingBagIcon,
              width: 24,
              height: 24,
              color: AppResources.appColors.globalDark,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.16,
            ),
            Text(
              '€$_bottomSheetPrice',
              style: AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
                color: AppResources.appColors.globalDark,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.06,
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.48,
                height: MediaQuery.of(context).size.width * 0.39,
                child: OutlinedButton(
                  onPressed: (_bottomSheetPrice == 0)
                      ? null
                      : () {
                          log.d('The bottom sheet price is $_bottomSheetPrice');
                          log.d('The number of tickets is $_numberOfTickets');

                          //inflate a dialog box to confirm the purchase
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Confirm Purchase',
                                  style: AppResources
                                      .appStyles.textStyles.bodyDefaultBold
                                      .copyWith(
                                    color:
                                        AppResources.appColors.typographyDark,
                                  ),
                                ),
                                content: Text(
                                  'Are you sure you want to buy $_numberOfTickets tickets for €$_bottomSheetPrice?',
                                  style: AppResources
                                      .appStyles.textStyles.bodyDefaultBold
                                      .copyWith(
                                    color:
                                        AppResources.appColors.typographyDark,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancel',
                                      style: AppResources
                                          .appStyles.textStyles.bodyDefaultBold
                                          .copyWith(
                                        color: AppResources
                                            .appColors.typographyDark,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Confirm',
                                      style: AppResources
                                          .appStyles.textStyles.bodyDefaultBold
                                          .copyWith(
                                        color: AppResources
                                            .appColors.typographyDark,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                  style: _numberOfTickets == 0
                      ? AppResources.buttonStyles.buttonStyle(
                          backgroundColor: AppResources.appColors.globalGrey,
                        )
                      : AppResources.buttonStyles.buttonStyle(
                          backgroundColor: AppResources.appColors.globalPrimary,
                        ),
                  child: Text(
                    'Buy ',
                    style: _numberOfTickets == 0
                        ? AppResources
                            .appStyles.textStyles.componentsButtonDefault
                            .copyWith(
                                color: AppResources.appColors.typographyDark)
                        : AppResources
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
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxScrollViewHeight),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.04,
                    MediaQuery.of(context).size.height * 0.03,
                    MediaQuery.of(context).size.width * 0.04,
                    0),
                child: Column(
                  children: [
                    Text(
                      'LaRosalia',
                      style:
                          AppResources.appStyles.textStyles.headineH5.copyWith(
                        color: AppResources.appColors.globalDark,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'Mon, Apr18 ·21:00 Pm ',
                      style:
                          AppResources.appStyles.textStyles.bodySmall.copyWith(
                        color: AppResources.appColors.typographyDark,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    Text(
                      'Palau Sant Jordi, Barcelona',
                      style:
                          AppResources.appStyles.textStyles.bodySmall.copyWith(
                        color: AppResources.appColors.typographyDark,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: event.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.017,
                          ),
                          SingleTicket(
                            myTicket: event.elementAt(index),
                            onDataChanged: updateBottomSheetData,
                            onNumberOfTicketsChanged: updateNumberOfTickets,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.017,
                          ),
                          Container(
                            color: AppResources.appColors.typographyGrey,
                            height: MediaQuery.of(context).size.height * 0.0007,
                          )
                        ]);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SingleTicket extends StatefulWidget {
  final PriceCategory? myTicket;

  //field for the callback function and call it whenever the data changes:
  final Function(double) onDataChanged;

  //field for the callback function and call it whenever the data changes(Number of tickets):
  final Function(int) onNumberOfTicketsChanged;

  const SingleTicket(
      {super.key,
      this.myTicket,
      required this.onDataChanged,
      required this.onNumberOfTicketsChanged});

  @override
  State<SingleTicket> createState() => _SingleTicketState();
}

class _SingleTicketState extends State<SingleTicket> {
  int? selectedValue = 0;
  late int eachTicketPrice = int.parse(widget.myTicket!.price!);
  double _totalPriceOfTickets = 0;

  //method to calculate total price
  double totalPriceCalculate({
    required int ticketPrice,
    required int numberOfTickets,
  }) {
    int result = ticketPrice * numberOfTickets;
    return result.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (widget.myTicket!.ticketType! == 'earlyBird')
                  ? 'Early Bird'
                  : (widget.myTicket!.ticketType! == 'general')
                      ? 'General'
                      : 'Second Release',
              style: AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
                color: AppResources.appColors.typographyDark,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.013,
            ),
            Text(
              '€${widget.myTicket!.price!}',
              style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                color: AppResources.appColors.typographyGrey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(
              'Sales End On ${widget.myTicket!.salesEnd!} ',
              style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                color: AppResources.appColors.typographyDark,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.41,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            style: AppResources.appStyles.textStyles.headineH6.copyWith(
              color: AppResources.appColors.typographyDark,
              fontSize: 18,
            ),
            value: selectedValue,
            items: const [
              0,
              1,
              2,
            ].map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text("$option"),
              );
            }).toList(),
            onChanged: (value) {
              if (selectedValue != value) {
                //Return the number of tickets from the dropdown button for each ticket
                //and call the callback function:
                setState(() {
                  int myValue = value! - selectedValue!;
                  selectedValue = value;
                  _totalPriceOfTickets = totalPriceCalculate(
                    numberOfTickets: myValue,
                    ticketPrice: eachTicketPrice,
                  );
                  widget.onDataChanged(_totalPriceOfTickets);
                  widget.onNumberOfTicketsChanged(myValue);
                });
              }
            },
          ),
        ),
      ],
    );
  }
}

//Custom type to return the number of tickets and ticket type
class NumberOfTickets {
  final int numberOfTickets;
  final String ticketType;

  NumberOfTickets({
    required this.numberOfTickets,
    required this.ticketType,
  });
}
