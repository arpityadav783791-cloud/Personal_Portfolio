import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/constants/portfolio_constants.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/utils/url_helper.dart';
import 'package:portfolio/core/widgets/section_header.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 10),
            Text('Copied $label to clipboard!'),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = Responsive.isDesktop(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          tag: 'Get in Touch',
          title: "Let's Connect — Ready for New Opportunities",
          subtitle:
              'Actively open to Flutter Developer roles and high-impact mobile software projects.',
        ),
        const SizedBox(height: 36),
        Container(
          padding: EdgeInsets.all(isDesktop ? 40 : 24),
          decoration: BoxDecoration(
            color: theme.cardTheme.color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: theme.colorScheme.outlineVariant.withAlpha(90),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Available Immediately for Full-Time Opportunities',
                      style: TextStyle(
                        color: const Color(0xFF10B981),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(
                'Ready to Deliver Production Value to Your Team',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Text(
                  'With hands-on experience shipping production modules for FixMyMeeting at Xavirgin Technologies, a proven grasp of Clean Architecture, MVVM, and REST APIs, I am prepared to hit the ground running on your mobile engineering team.',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 18),

              // Location & Contact Quick Badges
              Wrap(
                spacing: 12,
                runSpacing: 10,
                children: [
                  _InfoChip(
                    icon: Icons.location_on_outlined,
                    label: PortfolioConstants.location,
                    theme: theme,
                  ),
                  _InfoChip(
                    icon: Icons.school_outlined,
                    label:
                        '${PortfolioConstants.educationDegree} (CGPA: ${PortfolioConstants.cgpa})',
                    theme: theme,
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // High-Impact Outreach Actions for Recruiters
              Wrap(
                spacing: 14,
                runSpacing: 12,
                children: [
                  ElevatedButton.icon(
                    onPressed: () =>
                        UrlHelper.openEmail(PortfolioConstants.email),
                    icon: const Icon(Icons.email_outlined, size: 18),
                    label: const Text('Send Email'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () =>
                        UrlHelper.openPhone(PortfolioConstants.rawPhone),
                    icon: const Icon(Icons.phone_in_talk_outlined, size: 18),
                    label: const Text('Call: +91 7652086399'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF10B981),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () =>
                        UrlHelper.openUrl(PortfolioConstants.whatsappUrl),
                    icon: const Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 18,
                    ),
                    label: const Text('WhatsApp Chat'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () =>
                        UrlHelper.openUrl(PortfolioConstants.linkedinUrl),
                    icon: const Icon(Icons.link_rounded, size: 18),
                    label: const Text('LinkedIn Profile'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () =>
                        UrlHelper.openUrl(PortfolioConstants.githubUrl),
                    icon: const Icon(Icons.code_rounded, size: 18),
                    label: const Text('GitHub Profile'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _copyToClipboard(
                      context,
                      PortfolioConstants.email,
                      'Email address',
                    ),
                    icon: const Icon(Icons.copy_rounded, size: 16),
                    label: const Text('Copy Email'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.theme,
  });

  final IconData icon;
  final String label;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.colorScheme.primary.withAlpha(50)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.primary),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
