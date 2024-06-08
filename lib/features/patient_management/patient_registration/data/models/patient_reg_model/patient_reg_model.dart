class PatientRegistration {
  final String name;
  final String excecutive;
  final String payment;
  final String phone;
  final String address;
  final int totalAmount;
  final int discountAmount;
  final int advanceAmount;
  final int balanceAmount;
  final String dateAndTime;
  final String id;
  final List<int> male;
  final List<int> female;
  final String branch;
  final List<int> treatments;

  PatientRegistration(
      {required this.name,
      required this.excecutive,
      required this.payment,
      required this.phone,
      required this.address,
      required this.totalAmount,
      required this.discountAmount,
      required this.advanceAmount,
      required this.balanceAmount,
      required this.dateAndTime,
      required this.id,
      required this.male,
      required this.female,
      required this.branch,
      required this.treatments});
  Map<String, String> toMap() {
    return {
      'name': name,
      'excecutive': excecutive,
      'payment': payment,
      'phone': phone,
      'address': address,
      'total_amount': totalAmount.toString(),
      'discount_amount': discountAmount.toString(),
      'advance_amount': advanceAmount.toString(),
      'balance_amount': balanceAmount.toString(),
      'date_nd_time': dateAndTime,
      'id': id,
      'male': male.join(','),
      'female': female.join(','),
      'branch': branch,
      'treatments': treatments.join(','),
    };
  }
}
