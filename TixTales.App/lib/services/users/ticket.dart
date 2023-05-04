//Ticket model
class Ticket {
  final String? eventId;
  final String? ticketsBought;

  const Ticket({
    required this.eventId,
    required this.ticketsBought,
  });

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['eventId'] = eventId!;
    return data;
  }

  factory Ticket.fromMap(Map<String, dynamic> map) {
    return Ticket(
      eventId: map['eventId'],
      ticketsBought: map['ticketsBought'],
    );
  }
}
