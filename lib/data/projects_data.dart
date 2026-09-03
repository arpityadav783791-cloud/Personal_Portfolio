import 'package:portfolio/core/constants/portfolio_constants.dart';
import 'package:portfolio/data/models/project_model.dart';

class ProjectsData {
  ProjectsData._();

  static const List<ProjectModel> projects = [
    ProjectModel(
      id: 'fixmymeeting',
      title: 'FixMyMeeting (Production Application)',
      tagline:
          'Enterprise multi-module production app at Xavirgin Technologies',
      description:
          'Engineered and maintained mission-critical application modules for production deployment, including Marketplace, Auctions, Real-Time Chat, Notifications, and a dynamic Banner System. Integrated location-based services and REST APIs, delivering a highly scalable, resilient, and responsive architecture.',
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'Clean Architecture',
        'REST APIs',
        'Firebase',
        'Location Services',
        'Agile CI/CD',
      ],
      keyFeatures: [
        'Production Marketplace & real-time Auction bidding modules',
        'Real-time Chat with instant messaging and push notification alerts',
        'Dynamic Banner System enhancing brand interaction and user conversions',
        'Location-based service integration with background geolocation parsing',
      ],
      architecture:
          'Scalable Clean Architecture + GetX state management decoupling complex network services, local caching, and dynamic responsive views.',
      challenges:
          'Maintaining sub-second state synchronization across simultaneous real-time auction bids and chat messages without frame drops.',
      results:
          'Successfully deployed to production with high user retention, improved cross-device fluidity, and zero regression defects.',
      isFeatured: true,
    ),
    ProjectModel(
      id: 'trackmate',
      title: 'TrackMate',
      tagline: 'Personal activity & habit tracker with BLoC, Drift & Analytics',
      description:
          'A comprehensive personal scheduled activity and habit tracking application engineered in Flutter. Features structured daily schedule logging, interactive calendar timelines, dynamic visual performance analytics with FL Chart, robust offline persistence using Drift (SQLite), and reactive BLoC state management with GetIt dependency injection.',
      technologies: [
        'Flutter',
        'Dart',
        'BLoC & Cubit',
        'Drift (SQLite)',
        'FL Chart',
        'Table Calendar',
        'GoRouter',
        'GetIt',
      ],
      keyFeatures: [
        'Scheduled activity timeline and habit tracking with interactive Table Calendar integration',
        'Dynamic data analytics and trend graphs visualizing weekly and monthly performance using FL Chart',
        'Offline-first architecture with typed reactive database queries powered by Drift (SQLite)',
        'Decoupled Clean Architecture with BLoC state management and GetIt service location',
      ],
      architecture:
          'Clean Architecture with BLoC/Cubit pattern, Drift ORM database layer, and isolated repository contracts for maximum testability.',
      challenges:
          'Optimizing relational query performance and reactive stream emissions across complex multi-month activity logs without dropping UI frames.',
      results:
          'Fluid 60fps data visualizations, instant offline persistence, and seamless schedule navigation across viewports.',
      githubUrl: 'https://github.com/RishabhHatlunkar/trackmate',
      isFeatured: true,
    ),
    ProjectModel(
      id: 'tesla-news',
      title: 'Tesla News Application',
      tagline:
          'Real-time news aggregator built with Clean Architecture & REST APIs',
      description:
          'Developed a customized news aggregator utilizing a live News API, featuring advanced search capabilities. Adhered strictly to Clean Architecture principles to implement a highly responsive design unified across multiple mobile and tablet screen sizes.',
      technologies: [
        'Flutter',
        'Dart',
        'RESTful APIs',
        'HTTP',
        'JSON Parsing',
        'Clean Architecture',
        'URL Launcher',
      ],
      keyFeatures: [
        'Real-time news feed fetching and serialization using asynchronous HTTP requests',
        'Clean Architecture decoupling data sources, repository contracts, and presentation',
        'In-app responsive article reader with external source URL launching',
        'Advanced search and multi-category filtering for rapid content discovery',
      ],
      architecture:
          'Clean Architecture separating network data sources, repository contracts, and presentation state for complete testability.',
      challenges:
          'Handling variable network latency and nested JSON responses from external endpoints reliably without blocking UI frames.',
      results:
          'Stable, responsive article rendering with 60fps scrolling and robust offline fallback messaging.',
      githubUrl: '${PortfolioConstants.githubUrl}/tesla-news-application',
      isFeatured: true,
    ),
    ProjectModel(
      id: 'cricket-game',
      title: 'Engineering Cricket Game',
      tagline:
          'Interactive Flutter-based finger cricket game with custom animations',
      description:
          'Designed and programmed an interactive Flutter-based finger cricket game characterized by complex game logic and fluid custom animations. Applied reliable state management solutions to sustain consistent frame rates and gameplay stability.',
      technologies: [
        'Flutter',
        'Dart',
        'Custom Game Logic',
        'Fluid Animations',
        'Stateful UI',
      ],
      keyFeatures: [
        'Turn-based finger cricket gameplay with randomized computer opponent moves',
        'Real-time run calculation, wicket tracking, and target score chasing logic',
        'Custom visual indicators, celebration dialogs, and match summaries',
        'Instant restart and state-reset functionality with persistent session scoring',
      ],
      architecture:
          'Stateful reactive game loop managing match states, overs, wickets, and scoreboard updates.',
      challenges:
          'Synchronizing touch selection, random AI response generation, and scoreboard state transitions instantaneously without visual delays.',
      results:
          'Engaging, responsive mobile gaming experience running at full 60fps with intuitive touch controls.',
      githubUrl: '${PortfolioConstants.githubUrl}/Engineering_cricket_game',
      isFeatured: false,
    ),
    ProjectModel(
      id: 'weather-app',
      title: 'Weather Application',
      tagline: 'High-utility weather tracking app consuming live Weather API',
      description:
          'Created a high-utility weather tracking application consuming a dedicated Weather API for real-time local and global forecasts. Leveraged GetX for lightweight state management and incorporated a responsive city-based search infrastructure.',
      technologies: [
        'Flutter',
        'Dart',
        'GetX',
        'Weather REST API',
        'JSON Parsing',
        'Async UI',
      ],
      keyFeatures: [
        'Live city weather search with real-time temperature, humidity, and wind stats',
        'GetX reactive state management for instant search response and updates',
        'Multi-day forecast cards with visual weather condition indicators',
        'Clean visual cards with adaptive indicators matching current atmospheric conditions',
      ],
      architecture:
          'GetX Controller architecture performing async HTTP calls and deserializing JSON payloads into typed Dart models.',
      challenges:
          'Handling intermittent connectivity and mapping complex weather codes into intuitive visual icons.',
      results:
          'Fast, reliable weather forecasts with responsive layouts and graceful degradation on network drops.',
      githubUrl: '${PortfolioConstants.githubUrl}/weather_application',
      isFeatured: false,
    ),
    ProjectModel(
      id: 'unclutter-launcher',
      title: 'Unclutter Minimalist Launcher',
      tagline:
          'Digital detox Android home screen launcher to reduce distractions',
      description:
          'A clean, text-based minimalist launcher clone inspired by Minimalist Phone. Designed in Flutter to curb smartphone distraction, declutter daily app access, and optimize personal productivity.',
      technologies: [
        'Flutter',
        'Dart',
        'Android Intents',
        'Material Design',
        'Minimalist UI',
      ],
      keyFeatures: [
        'Alphabetized app list with instant fuzzy search for rapid launching',
        'Text-only home screen displaying curated focus applications',
        'Dark mode aesthetic engineered to save battery and reduce eye strain',
        'Distraction-free interface stripping away notification badges and flashy graphics',
      ],
      architecture:
          'Lightweight event-driven architecture querying installed Android packages with minimal memory footprint.',
      challenges:
          'Managing native platform channel intents while ensuring zero-delay launch transitions.',
      results:
          'Helps users dramatically reduce screen time through a clean, distraction-free home screen.',
      githubUrl: '${PortfolioConstants.githubUrl}/unclutter_launcher',
      isFeatured: false,
    ),
  ];
}
