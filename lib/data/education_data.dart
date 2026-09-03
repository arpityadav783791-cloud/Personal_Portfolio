import 'package:portfolio/data/models/experience_model.dart';

class EducationData {
  EducationData._();

  static const List<EducationModel> educationList = [
    EducationModel(
      degree: 'B.Tech in Artificial Intelligence',
      institution: 'University Engineering Program • Jaipur, Rajasthan',
      period: '2023 — 2027 (Expected)',
      score: 'CGPA: 8.5 / 10',
      highlights: [
        'Core coursework: Data Structures, Algorithms, Object-Oriented Programming, Artificial Intelligence, Database Management Systems, and Software Engineering.',
        'Hands-on expertise applying Machine Learning models and building scalable cross-platform client applications with Flutter.',
        'Academic excellence maintaining an 8.5/10 CGPA while concurrently contributing to production mobile software in industry.',
      ],
    ),
  ];
}
