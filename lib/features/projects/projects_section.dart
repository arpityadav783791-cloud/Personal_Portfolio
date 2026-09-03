import 'package:flutter/material.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/data/projects_data.dart';
import 'package:portfolio/features/projects/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          tag: 'Featured Work',
          title: 'Production Projects & Case Studies',
          subtitle:
              'Architected with clean separation of concerns, robust state management, and real-time backend integrations.',
        ),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final int crossAxisCount;
            if (width >= 960) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 1;
            }

            final cardWidth =
                (width - ((crossAxisCount - 1) * 24)) / crossAxisCount;

            return Wrap(
              spacing: 24,
              runSpacing: 24,
              children: [
                for (final project in ProjectsData.projects)
                  SizedBox(
                    width: cardWidth,
                    child: ProjectCard(project: project),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
