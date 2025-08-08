class DoctorModel {
  final String name;
  final String specialization;
  final String description;
  final String imagePath;
  final double rating;
  final double fees;
  final double experience;
  final List<String> workingHours;
  final List<String> workingDays;

  DoctorModel({
    required this.name,
    required this.specialization,
    required this.description,
    required this.imagePath,
    required this.rating,
    required this.fees,
    required this.experience,
    required this.workingHours,
    required this.workingDays,
  });
}
