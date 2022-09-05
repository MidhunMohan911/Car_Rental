class BookingDetailsModel {
  String carName;
  String? customer;
  String tripStarts;
  String tripEnds;
  String? location;
  String amount;
  String? id;

  BookingDetailsModel({
    required this.carName,
    this.customer,
    required this.tripEnds,
    this.location,
    required this.tripStarts,
    required this.amount,
    this.id,
  });
}
