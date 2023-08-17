import 'package:flutter/material.dart';
import 'package:tix_tales/services/events/priceCategory.dart';
import 'package:tix_tales/src/Constants/app_resources.dart';

class SingleTicketWidget extends StatefulWidget {
  final PriceCategory? myTicket;

  //field for the callback function and call it whenever the data changes:
  final Function(double) onDataChanged;

  //field for the callback function and call it whenever the data changes(Number of tickets):
  final Function(int) onNumberOfTicketsChanged;

  const SingleTicketWidget(
      {super.key,
      this.myTicket,
      required this.onDataChanged,
      required this.onNumberOfTicketsChanged});

  @override
  State<SingleTicketWidget> createState() => _SingleTicketWidgetState();
}

class _SingleTicketWidgetState extends State<SingleTicketWidget> {
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
