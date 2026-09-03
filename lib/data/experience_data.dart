import 'package:portfolio/data/models/experience_model.dart';

class ExperienceData {
  ExperienceData._();

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Flutter Developer',
      company: 'Xavirgin Technologies',
      period: 'June 2026 — Present',
      location: 'Jaipur, Rajasthan',
      responsibilities: [
        'Developed and maintained critical modules for production application (FixMyMeeting), including Marketplace, Auctions, Real-time Chat, and Notifications.',
        'Engineered a highly responsive UI and dynamic Banner System, significantly improving overall cross-device performance and visual engagement.',
        'Implemented location-based services and complex RESTful APIs, guaranteeing a highly scalable and resilient architecture.',
        'Executed comprehensive bug fixing, optimized memory and rendering performance, and integrated third-party SDKs within an Agile development environment.',
        'Maintained code integrity and facilitated continuous integration through strict Git workflows, structured Pull Requests, and code reviews.',
      ],
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'Clean Architecture',
        'REST APIs',
        'Firebase',
        'Git & GitHub',
        'Postman',
      ],
      achievements:
          'Shipped mission-critical production features for FixMyMeeting, improving application responsiveness and delivering a crash-free experience across Android and iOS.',
    ),
  ];
}
