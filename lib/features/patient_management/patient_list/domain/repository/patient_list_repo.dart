abstract class PatientRepository {
  Future<List<String>> fetchPatients(String token);
}
