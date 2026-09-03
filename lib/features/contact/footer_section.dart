import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/portfolio_constants.dart';
import 'package:portfolio/core/navigation/portfolio_navigation.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/utils/url_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nav = PortfolioNavigationScope.of(context);
    final isDesktop = Responsive.isDesktop(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant.withAlpha(70),
            width: 1,
          ),
        ),
      ),
      child: isDesktop
          ? Row(
              children: [
                Expanded(
                  child: Text(
                    '© ${DateTime.now().year} ${PortfolioConstants.name}. Built with Flutter & Dart.',
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                  ),
                ),
                const SizedBox(width: 16),
                _SocialLinks(),
                const SizedBox(width: 24),
                _BackToTopButton(onPressed: nav.scrollToTop),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _SocialLinks(),
                const SizedBox(height: 16),
                Text(
                  '© ${DateTime.now().year} ${PortfolioConstants.name}. Built with Flutter & Dart.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 16),
                _BackToTopButton(onPressed: nav.scrollToTop),
              ],
            ),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.code_rounded, size: 20),
          tooltip: 'GitHub',
          onPressed: () => UrlHelper.openUrl(PortfolioConstants.githubUrl),
        ),
        IconButton(
          icon: const Icon(Icons.link_rounded, size: 20),
          tooltip: 'LinkedIn',
          onPressed: () => UrlHelper.openUrl(PortfolioConstants.linkedinUrl),
        ),
        IconButton(
          icon: const Icon(Icons.mail_outline_rounded, size: 20),
          tooltip: 'Email',
          onPressed: () => UrlHelper.openEmail(PortfolioConstants.email),
        ),
      ],
    );
  }
}

class _BackToTopButton extends StatelessWidget {
  const _BackToTopButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_upward_rounded, size: 16),
      label: const Text('Back to top'),
      style: TextButton.styleFrom(
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}
