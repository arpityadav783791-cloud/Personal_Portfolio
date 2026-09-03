import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/url_helper.dart';
import 'package:portfolio/data/models/project_model.dart';
import 'package:portfolio/features/projects/widgets/project_detail_dialog.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({required this.project, super.key});

  final ProjectModel project;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? theme.colorScheme.primary.withAlpha(160)
                : theme.colorScheme.outlineVariant.withAlpha(80),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withAlpha(
                      isDark ? 30 : 15,
                    ),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Featured badge & external links
              Row(
                children: [
                  if (widget.project.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'FEATURED',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  const Spacer(),
                  if (widget.project.githubUrl != null)
                    IconButton(
                      icon: const Icon(Icons.code_rounded, size: 20),
                      tooltip: 'View Source Code',
                      onPressed: () =>
                          UrlHelper.openUrl(widget.project.githubUrl!),
                    ),
                  if (widget.project.liveUrl != null)
                    IconButton(
                      icon: const Icon(Icons.open_in_new_rounded, size: 18),
                      tooltip: 'View Live Demo',
                      onPressed: () =>
                          UrlHelper.openUrl(widget.project.liveUrl!),
                    ),
                ],
              ),
              const SizedBox(height: 12),

              // Title & tagline
              Text(
                widget.project.title,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.project.tagline,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                widget.project.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),

              // Tech stack chips
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final tech in widget.project.technologies.take(4))
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? const Color(0xFF1E293B)
                            : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ),
                  if (widget.project.technologies.length > 4)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        '+${widget.project.technologies.length - 4} more',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              // Learn More action
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () =>
                      ProjectDetailDialog.show(context, widget.project),
                  icon: const Icon(Icons.info_outline_rounded, size: 16),
                  label: const Text('View Case Study'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
