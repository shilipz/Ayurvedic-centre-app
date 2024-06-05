class Patient {
  final int id;
  final String name;
  final String? treatmentName;
  final String? date;

  Patient({
    required this.id,
    required this.name,
    this.treatmentName,
    this.date,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    final patientDetails = json['patientdetails_set'];
    return Patient(
      id: json['id'],
      name: json['name'],
      treatmentName: patientDetails.isNotEmpty
          ? patientDetails[0]['treatment_name']
          : 'No treatment',
      date: json['date_nd_time'],
    );
  }
}
