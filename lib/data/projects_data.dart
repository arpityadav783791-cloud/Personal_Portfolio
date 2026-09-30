import 'models/project_model.dart';

class ProjectsData {
  static const List<ProjectModel> projects = [
    ProjectModel(
      id: 'trackmate',
      title: 'TrackMate',
      tagline: 'Offline-first activity and habit tracker',
      description:
          'Built an offline-first scheduled activity and habit tracker using BLoC state management and typed Drift persistence. Engineered interactive visual analytics and trend metrics with FL Chart and calendar-based timeline scheduling.',
      technologies: ['Flutter', 'Dart', 'BLoC', 'Drift', 'SQLite', 'FL Chart'],
      keyFeatures: [
        'Offline-first architecture',
        'Habit and activity tracking',
        'Visual analytics and trend metrics',
        'Calendar-based scheduling',
      ],
      architecture:
          'Flutter application using BLoC state management with Drift for typed local persistence.',
      challenges:
          'Designing reliable offline-first data handling and interactive activity analytics.',
      results:
          'Delivered an offline-first tracker with persistent scheduling, analytics, and trend visualization.',
      githubUrl: 'https://github.com/RishabhHatlunkar/trackmate.git',
      isFeatured: true,
    ),

    ProjectModel(
      id: 'linux-rdp-client',
      title: 'Linux RDP Client',
      tagline: 'Cross-platform Linux remote desktop client',
      description:
          'Built a Linux remote desktop client with connection management, persistent storage, add/edit flows, status tracking, and FreeRDP launching via system processes. Implemented connection validation, favorites/search, configurable resolution, clipboard/audio options, and user-friendly RDP error mapping.',
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'GetStorage',
        'FreeRDP',
        'Linux',
      ],
      keyFeatures: [
        'RDP connection management',
        'Persistent connection storage',
        'FreeRDP integration',
        'Connection validation',
        'Favorites and search',
        'Configurable resolution',
        'Clipboard and audio support',
      ],
      architecture:
          'Flutter application using GetX, GetStorage, and Linux system process integration with FreeRDP.',
      challenges:
          'Managing RDP processes, connection states, validation, and platform-specific Linux behavior.',
      results:
          'Delivered a functional Linux RDP client with persistent connections, configuration options, and error handling.',
      githubUrl:
          'https://github.com/arpityadav783791-cloud/RemoteDesktopConnectivity',
      isFeatured: true,
    ),

    ProjectModel(
      id: 'qrcode-generator-reader',
      title: 'QRCode Generator Reader',
      tagline: 'Cross-platform QR code generator and reader',
      description:
          'Developed a cross-platform Flutter application that generates QR codes and reads/scans QR codes from the application interface.',
      technologies: ['Flutter', 'Dart', 'QR Code'],
      keyFeatures: [
        'QR code generation',
        'QR code scanning',
        'Cross-platform interface',
      ],
      architecture:
          'Flutter cross-platform application with QR generation and scanning workflows.',
      challenges:
          'Integrating QR generation and scanning while maintaining a simple cross-platform user experience.',
      results:
          'Delivered a functional application capable of generating and reading QR codes.',
      githubUrl:
          'https://github.com/arpityadav783791-cloud/QRCodeGeneratorReader',
      isFeatured: false,
    ),

    ProjectModel(
      id: 'cat-dog-classifier',
      title: 'Cat Dog Classifier',
      tagline: 'Flutter image classification application',
      description:
          'Built a Flutter image-classification application for identifying cats and dogs, integrating an image classification model into the app workflow.',
      technologies: [
        'Flutter',
        'Dart',
        'Machine Learning',
        'Image Classification',
      ],
      keyFeatures: [
        'Image classification',
        'Cat and dog recognition',
        'ML model integration',
      ],
      architecture:
          'Flutter application integrating an image classification model into the application workflow.',
      challenges:
          'Connecting the machine-learning inference workflow with the Flutter user interface.',
      results:
          'Delivered an image classification application capable of identifying cats and dogs.',
      githubUrl:
          'https://github.com/arpityadav783791-cloud/CatDogClassifierFlutterApplication.git',
      isFeatured: false,
    ),

    ProjectModel(
      id: 'duplicate-deleter',
      title: 'duplicate Deleter Application',
      tagline: 'Duplicate file detection and cleanup application',
      description:
          'Built a duplicate-file detection and cleanup application with folder scanning, duplicate grouping, storage analysis, selective Keep One flow, and deletion confirmation. Migrated the duplicate-detection engine to Dart and added automated tests for the core scanning and hashing workflow.',
      technologies: ['Flutter', 'Dart', 'File System', 'Hashing', 'Testing'],
      keyFeatures: [
        'Folder scanning',
        'Duplicate file detection',
        'Storage analysis',
        'Keep One workflow',
        'Deletion confirmation',
        'Automated testing',
      ],
      architecture:
          'Flutter application with a Dart-based duplicate detection engine using file scanning and hashing.',
      challenges:
          'Efficiently scanning files, identifying duplicates, handling large file sets, and safely deleting selected files.',
      results:
          'Delivered a duplicate-file cleanup workflow with storage analysis, Keep One functionality, deletion confirmation, and automated tests.',
      githubUrl:
          'https://github.com/arpityadav783791-cloud/duplicate_deleter_application.git',
      isFeatured: true,
    ),

    ProjectModel(
      id: 'engineering-cricket',
      title: 'Engineering Cricket',
      tagline: 'Interactive Flutter finger-cricket game',
      description:
          'Designed and programmed an interactive finger-cricket game with custom game logic, state handling, animations, and persistent game state.',
      technologies: ['Flutter', 'Dart', 'Game Logic', 'Animations'],
      keyFeatures: [
        'Custom game logic',
        'State handling',
        'Interactive gameplay',
        'Custom animations',
        'Persistent game state',
      ],
      architecture:
          'Flutter application built around custom game logic, state handling, animations, and persistent game state.',
      challenges:
          'Implementing consistent game rules, interactive state transitions, and smooth gameplay animations.',
      results:
          'Delivered an interactive finger-cricket game with custom gameplay logic and persistent state.',
      githubUrl:
          'https://arpityadav783791-cloud.github.io/Engineering_cricket_game/',
      isFeatured: false,
    ),
  ];
}
