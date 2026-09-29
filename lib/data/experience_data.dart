import 'package:portfolio/data/models/experience_model.dart';

class ExperienceData {
  ExperienceData._();

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Flutter Developer Intern → Flutter Team Lead',
      company: 'Xavirgin Technologies',
      period: 'April 2026 — Present',
      location: 'Jaipur, Rajasthan',
      responsibilities: [
        'Joined Xavirgin Technologies as a Flutter Developer Intern in April 2026 and contributed to production Flutter application development, UI implementation, API integration, debugging, and feature delivery.',
        'Worked on FixMyMeeting, contributing to responsive UI development, REST API integration, location-based services, performance improvements, and production bug resolution.',
        'Promoted to Flutter Team Lead for a 3-month period, taking additional responsibility for coordinating Flutter development tasks, supporting team members, reviewing implementation approaches, and maintaining development quality.',
        'Contributed to improving codebase quality, application reliability, and smooth user experience while working with Flutter, Dart, GetX/BLoC, REST APIs, and production development workflows.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'BLoC',
        'Clean Architecture',
        'MVVM',
        'REST APIs',
        'Firebase',
        'Git & GitHub',
        'Postman',
      ],
      achievements:
          'Progressed from Flutter Developer Intern to Flutter Team Lead during the internship, taking on additional technical coordination and team support responsibilities.',
    ),
  ];
}
