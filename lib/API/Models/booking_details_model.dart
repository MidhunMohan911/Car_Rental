class BookingDetailsModel {
  String carName;
  String customer;
  String tripStarts;
  String tripEnds;
  String location;
  String amount;

  BookingDetailsModel({
    required this.carName,
    required this.customer,
    required this.tripEnds,
    required this.location,
    required this.tripStarts,
    required this.amount,
  });
}
