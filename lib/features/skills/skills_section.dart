import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/widgets/section_header.dart';
import 'package:portfolio/data/skills_data.dart';
import 'package:portfolio/features/skills/widgets/skill_category_card.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          tag: 'Technical Skills',
          title: 'Specialized Technologies & Tools',
          subtitle:
              'A curated stack developed through production application delivery, architectural design, and rigorous hands-on problem solving.',
        ),
        const SizedBox(height: 36),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final int crossAxisCount;
            if (width >= Responsive.tabletBreakpoint) {
              crossAxisCount = 3;
            } else if (width >= Responsive.mobileBreakpoint) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 1;
            }

            final cardWidth =
                (width - ((crossAxisCount - 1) * 20)) / crossAxisCount;

            return Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (final category in SkillsData.categories)
                  SizedBox(
                    width: cardWidth,
                    child: SkillCategoryCard(category: category),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
