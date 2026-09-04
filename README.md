# Arpit Yadav — Flutter Developer Portfolio

A responsive, production-quality personal developer portfolio website built with **Flutter Web** and **Material 3**. Engineered to showcase cross-platform engineering expertise, clean code architecture, and high-performance user experiences.

Live Demo: [https://arpityadav783791-cloud.github.io/Personal_Portfolio/](https://arpityadav783791-cloud.github.io/Personal_Portfolio/)

---

## Key Features

- **Fluid Responsive Layout**: Seamlessly adapts from 320px mobile viewports up to 4K ultrawide monitors using adaptive breakpoints and constraints.
- **Modern Theme System**: Cohesive Light & Dark themes with instant toggle support.
- **Section Navigation & Smooth Scrolling**: Desktop navbar with hover states and a mobile navigation drawer with smooth scroll actions using `Scrollable.ensureVisible`.
- **Interactive Project Showcase**: Filtered project cards with tech tags, source code links, live demos, and an in-depth **Case Study Modal** detailing architecture, challenges, and measurable results.
- **Grouped Technical Skills**: Logical grouping across Flutter, Architecture/State Management (BLoC/Cubit), Backend/APIs, Cloud Services, and Tooling.
- **Career & Education Journey**: Structured timeline displaying professional responsibilities, quantifiable achievements, and computer science foundations.
- **Accessible & SEO Optimized**: Configured with meta descriptions, Open Graph cards, ARIA labels, semantic buttons, and tooltips.
- **100% Free & Zero-Backend**: Deployed on GitHub Pages via GitHub Actions CI/CD with zero hosting costs.

---

## Tech Stack

| Layer | Technologies |
|---|---|
| **Framework** | Flutter Web (Stable Channel) |
| **Language** | Dart 3.x (Sound Null Safety) |
| **Design System** | Material 3 (Custom curated color palettes) |
| **Architecture** | Feature-First Modular Structure, Scoped Controllers |
| **Navigation & Links** | `url_launcher`, `PortfolioNavigationController` |
| **CI / CD** | GitHub Actions & GitHub Pages |

---

## Project Structure

```text
lib/
├── app/
│   ├── app.dart                       # App entrypoint with ThemeScope
│   └── theme/
│       ├── app_colors.dart            # Curated light and dark palettes
│       ├── app_theme.dart             # Material 3 ThemeData specifications
│       └── theme_mode_notifier.dart   # Scoped theme switcher
│
├── core/
│   ├── constants/
│   │   └── portfolio_constants.dart   # Centralized portfolio constants & links
│   ├── navigation/
│   │   └── portfolio_navigation.dart  # GlobalKey scroll controller & section enum
│   ├── responsive/
│   │   ├── responsive.dart            # Breakpoints and width utilities
│   │   └── responsive_spacing.dart    # Adaptive vertical spacing
│   ├── utils/
│   │   └── url_helper.dart            # Safe external link and mailto launcher
│   └── widgets/
│       ├── app_shell.dart             # Header, navbar, theme toggle, and mobile drawer
│       ├── page_container.dart        # Max-width 1200px responsive container
│       └── section_header.dart        # Section title badge and headline component
│
├── data/
│   ├── models/                        # Project, Skill, Experience data classes
│   ├── projects_data.dart             # Production project models & case studies
│   ├── skills_data.dart               # Categorized skills list
│   ├── experience_data.dart           # Professional career history
│   └── education_data.dart            # Academic credentials
│
├── features/
│   ├── hero/                          # Hero section and code preview visual
│   ├── about/                         # Engineering philosophy and architecture pillars
│   ├── skills/                        # Interactive skill category cards
│   ├── projects/                      # Responsive project grid & case study dialog
│   ├── experience/                    # Experience timeline & education cards
│   ├── contact/                       # Contact action buttons & footer
│   └── home/                          # Main assembled single-page view
│
└── main.dart                          # Application entry point
```

---

## Getting Started Locally

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.12+ / 3.24+)
- Google Chrome, Microsoft Edge, or any modern web browser

### Run Locally

1. Clone this repository:
   ```bash
   git clone https://github.com/arpityadav/portfolio.git
   cd portfolio
   ```

2. Fetch dependencies:
   ```bash
   flutter pub get
   ```

3. Run the web development server:
   ```bash
   flutter run -d chrome
   ```

---

## Quality Assurance & Verification

Run static analysis and tests:

```bash
flutter analyze
flutter test
dart format --output=none --set-exit-if-changed lib
```

---

## Production Build & Deployment

### Manual Build

Build an optimized production bundle:

```bash
flutter build web --release --base-href "/portfolio/"
```

The compiled output will be located in `build/web/` and can be hosted statically on any web server or GitHub Pages.

### Automated CI/CD (GitHub Actions)

A GitHub Actions workflow is provided in `.github/workflows/deploy.yml`. Once pushed to the `main` branch with GitHub Pages enabled under repository settings (`Settings -> Pages -> Source: GitHub Actions`), the site will build and deploy automatically.

---

## Contact

- **Arpit Yadav** — Flutter Developer
- **Email**: [arpityadav783791@gmail.com](mailto:arpityadav783791@gmail.com)
- **GitHub**: [@arpityadav783791-cloud](https://github.com/arpityadav783791-cloud)
- **LinkedIn**: [Arpit Yadav](https://linkedin.com/in/arpityadav)
