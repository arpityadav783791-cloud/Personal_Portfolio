import 'package:flutter/material.dart';
import 'package:portfolio/data/models/skill_model.dart';

class SkillsData {
  SkillsData._();

  static const List<SkillCategory> categories = [
    SkillCategory(
      title: 'Languages & Frameworks',
      icon: Icons.flutter_dash_rounded,
      skills: [
        'Flutter',
        'Dart',
        'Material 3',
        'Responsive UI',
        'Flutter Web',
        'Custom Animations',
      ],
    ),
    SkillCategory(
      title: 'Architecture & State Management',
      icon: Icons.account_tree_outlined,
      skills: [
        'Clean Architecture',
        'MVVM Pattern',
        'GetX',
        'Provider',
        'BLoC & Cubit',
      ],
    ),
    SkillCategory(
      title: 'Backend, APIs & Storage',
      icon: Icons.cloud_sync_outlined,
      skills: [
        'REST APIs',
        'JSON Serialization',
        'Firebase',
        'SQLite',
        'Shared Preferences',
        'HTTP & Dio',
      ],
    ),
    SkillCategory(
      title: 'Tools & Workflow',
      icon: Icons.terminal_rounded,
      skills: [
        'Git',
        'GitHub',
        'Android Studio',
        'VS Code',
        'Postman',
        'Pull Requests & CI',
      ],
    ),
    SkillCategory(
      title: 'Core Competencies',
      icon: Icons.verified_user_outlined,
      skills: [
        'Production App Delivery',
        'Responsive Design',
        'Performance Optimization',
        'Problem Solving',
        'Agile Collaboration',
      ],
    ),
  ];
}
