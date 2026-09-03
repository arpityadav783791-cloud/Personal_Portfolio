import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/portfolio_constants.dart';
import 'package:portfolio/core/navigation/portfolio_navigation.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/utils/url_helper.dart';
import 'package:portfolio/features/hero/widgets/hero_visual.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nav = PortfolioNavigationScope.of(context);
    final isDesktop = Responsive.isDesktop(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: isDesktop ? 64 : 32),
      child: isDesktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: _HeroContent(nav: nav, theme: theme),
                ),
                const SizedBox(width: 48),
                const Expanded(flex: 5, child: HeroVisual()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeroContent(nav: nav, theme: theme),
                const SizedBox(height: 48),
                const HeroVisual(),
              ],
            ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  const _HeroContent({required this.nav, required this.theme});

  final PortfolioNavigationController nav;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Role pill badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(20),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.colorScheme.primary.withAlpha(50)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                PortfolioConstants.role,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Greeting
        Text(
          PortfolioConstants.heroGreeting,
          style: theme.textTheme.displayMedium?.copyWith(
            fontSize: isMobile ? 32 : 44,
          ),
        ),
        const SizedBox(height: 12),

        // Headline
        Text(
          PortfolioConstants.heroHeadline,
          style: theme.textTheme.headlineLarge?.copyWith(
            fontSize: isMobile ? 24 : 32,
            height: 1.25,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 16),

        // Subtext
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Text(
            PortfolioConstants.heroSubtext,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: isMobile ? 16 : 17,
            ),
          ),
        ),
        const SizedBox(height: 32),

        // Action Buttons
        Wrap(
          spacing: 16,
          runSpacing: 14,
          children: [
            ElevatedButton.icon(
              onPressed: () => nav.scrollToSection(PortfolioSection.projects),
              icon: const Icon(Icons.arrow_downward_rounded, size: 18),
              label: const Text('View Projects'),
            ),
            OutlinedButton.icon(
              onPressed: () => UrlHelper.openUrl(PortfolioConstants.resumePath),
              icon: const Icon(Icons.description_outlined, size: 18),
              label: const Text('Download Resume'),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Social Links
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SocialIconButton(
              icon: Icons.code_rounded,
              tooltip: 'GitHub Profile',
              onPressed: () => UrlHelper.openUrl(PortfolioConstants.githubUrl),
            ),
            const SizedBox(width: 8),
            _SocialIconButton(
              icon: Icons.link_rounded,
              tooltip: 'LinkedIn Profile',
              onPressed: () =>
                  UrlHelper.openUrl(PortfolioConstants.linkedinUrl),
            ),
            const SizedBox(width: 8),
            _SocialIconButton(
              icon: Icons.email_outlined,
              tooltip: 'Send Email',
              onPressed: () => UrlHelper.openEmail(PortfolioConstants.email),
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Quick Stats row
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: const [
            _StatItem(value: '2+', label: 'Years Experience'),
            _StatItem(value: '10+', label: 'Projects Built'),
            _StatItem(value: '100%', label: 'Clean Code Standard'),
          ],
        ),
      ],
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton.outlined(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      tooltip: tooltip,
      style: IconButton.styleFrom(
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withAlpha(100),
        ),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
