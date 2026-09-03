class ExperienceModel {
  const ExperienceModel({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.responsibilities,
    required this.technologies,
    required this.achievements,
  });

  final String role;
  final String company;
  final String period;
  final String location;
  final List<String> responsibilities;
  final List<String> technologies;
  final String achievements;
}

class EducationModel {
  const EducationModel({
    required this.degree,
    required this.institution,
    required this.period,
    required this.score,
    required this.highlights,
  });

  final String degree;
  final String institution;
  final String period;
  final String score;
  final List<String> highlights;
}
