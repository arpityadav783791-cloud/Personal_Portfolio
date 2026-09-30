import 'package:flutter/material.dart';
import 'package:portfolio/core/navigation/portfolio_navigation.dart';
import 'package:portfolio/core/responsive/responsive_spacing.dart';
import 'package:portfolio/core/widgets/app_shell.dart';
import 'package:portfolio/core/widgets/page_container.dart';
import 'package:portfolio/features/about/about_section.dart';
import 'package:portfolio/features/certificates/certificates_section.dart';
import 'package:portfolio/features/contact/contact_section.dart';
import 'package:portfolio/features/contact/footer_section.dart';
import 'package:portfolio/features/experience/education_section.dart';
import 'package:portfolio/features/experience/experience_section.dart';
import 'package:portfolio/features/hero/hero_section.dart';
import 'package:portfolio/features/projects/projects_section.dart';
import 'package:portfolio/features/skills/skills_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(child: _HomeContent());
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final nav = PortfolioNavigationScope.of(context);
    final sectionSpacing = ResponsiveSpacing.sectionVertical(context);

    return PageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Hero Section (Top)
          const HeroSection(),
          SizedBox(height: sectionSpacing),

          // About Section
          KeyedSubtree(
            key: nav.sectionKeys[PortfolioSection.about],
            child: const AboutSection(),
          ),
          SizedBox(height: sectionSpacing),

          // Skills Section
          KeyedSubtree(
            key: nav.sectionKeys[PortfolioSection.skills],
            child: const SkillsSection(),
          ),
          SizedBox(height: sectionSpacing),

          // Projects Section
          KeyedSubtree(
            key: nav.sectionKeys[PortfolioSection.projects],
            child: const ProjectsSection(),
          ),
          SizedBox(height: sectionSpacing),

          // Certifications Section
          // Certifications Section
          KeyedSubtree(
            key: nav.sectionKeys[PortfolioSection.certificates],
            child: const CertificatesSection(),
          ),
          SizedBox(height: sectionSpacing),

          // Experience & Education Section
          KeyedSubtree(
            key: nav.sectionKeys[PortfolioSection.experience],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ExperienceSection(),
                SizedBox(height: sectionSpacing),
                const EducationSection(),
              ],
            ),
          ),

          SizedBox(height: sectionSpacing),

          // Contact Section
          KeyedSubtree(
            key: nav.sectionKeys[PortfolioSection.contact],
            child: const ContactSection(),
          ),

          SizedBox(height: sectionSpacing),

          // Footer
          const FooterSection(),
        ],
      ),
    );
  }
}
