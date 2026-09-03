import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = Responsive.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          tag: 'About Me',
          title:
              'Crafting Reliable, Scalable & High-Performance Flutter Software',
          subtitle:
              'A disciplined approach to software engineering with a focus on maintainability, state isolation, and seamless user experiences.',
        ),
        const SizedBox(height: 36),

        // Main narrative block
        Container(
          padding: EdgeInsets.all(isDesktop ? 32 : 24),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withAlpha(80),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Philosophy & Engineering Mindset',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'I am a production-focused Flutter Developer currently contributing to commercial software at Xavirgin Technologies (FixMyMeeting) and pursuing a B.Tech in Artificial Intelligence (CGPA: 8.5/10). I specialize in developing responsive UIs, integrating RESTful APIs, and implementing Clean Architecture & MVVM patterns to guarantee modular, maintainable, and high-performance cross-platform software.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'With practical experience shipping production modules across Marketplace, Auctions, Real-Time Chat, and Notifications, I combine strong problem-solving skills with disciplined Git workflows and proactive Agile team collaboration.',
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Highlight Pillars
        if (isDesktop)
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _PillarCard(
                  icon: Icons.architecture_rounded,
                  title: 'Clean Architecture',
                  description:
                      'Feature-first code structure, domain-driven contracts, and explicit state management via BLoC/Cubit for maximum long-term maintainability.',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _PillarCard(
                  icon: Icons.devices_rounded,
                  title: 'Responsive & Web',
                  description:
                      'Fluid layouts engineered to look native and feel responsive from 320px smartphones to 4K ultra-wide monitors.',
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: _PillarCard(
                  icon: Icons.speed_rounded,
                  title: 'Performance & QA',
                  description:
                      'Rigorous profiling with Flutter DevTools, elimination of unnecessary rebuilds, robust error boundary logging, and zero-warning codebases.',
                ),
              ),
            ],
          )
        else
          const Column(
            children: [
              _PillarCard(
                icon: Icons.architecture_rounded,
                title: 'Clean Architecture',
                description:
                    'Feature-first code structure, domain-driven contracts, and explicit state management via BLoC/Cubit for maximum long-term maintainability.',
              ),
              SizedBox(height: 16),
              _PillarCard(
                icon: Icons.devices_rounded,
                title: 'Responsive & Web',
                description:
                    'Fluid layouts engineered to look native and feel responsive from 320px smartphones to 4K ultra-wide monitors.',
              ),
              SizedBox(height: 16),
              _PillarCard(
                icon: Icons.speed_rounded,
                title: 'Performance & QA',
                description:
                    'Rigorous profiling with Flutter DevTools, elimination of unnecessary rebuilds, robust error boundary logging, and zero-warning codebases.',
              ),
            ],
          ),
      ],
    );
  }
}

class _PillarCard extends StatelessWidget {
  const _PillarCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withAlpha(80),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withAlpha(25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 24, color: theme.colorScheme.primary),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(description, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
