import 'package:flutter/material.dart';
import 'package:tix_tales/services/events/event.dart';
import 'package:tix_tales/src/Constants/app_assets.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    //get event details
    final List<PriceCategory> event =
        ModalRoute.of(context)?.settings.arguments as List<PriceCategory>;

    final screenHeight = MediaQuery.of(context).size.height;
    const bottomSheetHeight = 87.0;
    final maxScrollViewHeight = screenHeight - bottomSheetHeight;

    return SafeArea(
      child: Scaffold(
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
                '€67.00',
                style:
                    AppResources.appStyles.textStyles.bodyDefaultBold.copyWith(
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
                    onPressed: () {},
                    style: AppResources.buttonStyles.buttonStyle(
                      backgroundColor: AppResources.appColors.globalPrimary,
                    ),
                    child: Text(
                      'Buy ',
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
                            ticket: event.elementAt(index),
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
  final PriceCategory ticket;

  const SingleTicket({super.key, required this.ticket});

  @override
  State<SingleTicket> createState() => _SingleTicketState();
}

class _SingleTicketState extends State<SingleTicket> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (widget.ticket.ticketType! == 'earlyBird')
                  ? 'Early Bird'
                  : (widget.ticket.ticketType! == 'general')
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
              '€${widget.ticket.price!}',
              style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                color: AppResources.appColors.typographyGrey,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Text(
              'Sales End on ${widget.ticket.salesEnd!} ',
              style: AppResources.appStyles.textStyles.bodySmall.copyWith(
                color: AppResources.appColors.typographyDark,
              ),
            ),
          ],
        ),
        DropdownButton<String>(
          underline: Container(),
          style: AppResources.appStyles.textStyles.headineH6.copyWith(
            color: AppResources.appColors.typographyDark,
            fontSize: 18,
          ),
          value: selectedValue,
          items: const [
            DropdownMenuItem(
              value: '1',
              child: Text('1'),
            ),
            DropdownMenuItem(
              value: '2',
              child: Text('2'),
            ),
            DropdownMenuItem(
              value: '3',
              child: Text('3'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ),
      ],
    );
  }
}
