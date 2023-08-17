//Favourite model
class Favourite {
  final String? eventId;

  const Favourite({required this.eventId});

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['eventId'] = eventId!;
    return data;
  }

  factory Favourite.fromMap(Map<String, dynamic> map) {
    return Favourite(
      eventId: map['eventId'],
    );
  }
}
