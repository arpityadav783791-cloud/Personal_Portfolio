import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/theme_mode_notifier.dart';
import 'package:portfolio/core/constants/portfolio_constants.dart';
import 'package:portfolio/core/navigation/portfolio_navigation.dart';
import 'package:portfolio/core/responsive/responsive.dart';
import 'package:portfolio/core/widgets/page_container.dart';

class AppShell extends StatefulWidget {
  const AppShell({required this.child, this.controller, super.key});

  final Widget child;
  final PortfolioNavigationController? controller;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final PortfolioNavigationController _navController;
  late final bool _internalController;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _navController = widget.controller!;
      _internalController = false;
    } else {
      _navController = PortfolioNavigationController();
      _internalController = true;
    }
  }

  @override
  void dispose() {
    if (_internalController) {
      _navController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PortfolioNavigationScope(
      controller: _navController,
      child: Scaffold(
        endDrawer: const _MobileNavigationDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              const _NavigationBar(),
              Expanded(
                child: SingleChildScrollView(
                  controller: _navController.scrollController,
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    final nav = PortfolioNavigationScope.of(context);
    final theme = Theme.of(context);
    final themeNotifier = ThemeScope.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant.withAlpha(50),
            width: 1,
          ),
        ),
      ),
      child: PageContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              // Logo
              InkWell(
                onTap: nav.scrollToTop,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          PortfolioConstants.initials,
                          style: TextStyle(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      if (Responsive.width(context) >= 500) ...[
                        const SizedBox(width: 10),
                        Text(
                          PortfolioConstants.shortName.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const Spacer(),
              // Theme Toggle
              IconButton(
                icon: Icon(
                  themeNotifier.isDarkMode
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                  size: 20,
                ),
                tooltip: themeNotifier.isDarkMode
                    ? 'Switch to Light Mode'
                    : 'Switch to Dark Mode',
                onPressed: themeNotifier.toggleTheme,
              ),
              const SizedBox(width: 8),
              if (Responsive.isDesktop(context))
                const _DesktopNavigation()
              else
                const _MobileMenuButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopNavigation extends StatelessWidget {
  const _DesktopNavigation();

  @override
  Widget build(BuildContext context) {
    final nav = PortfolioNavigationScope.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final section in PortfolioSection.values)
          _DesktopNavItem(
            title: section.label,
            onTap: () => nav.scrollToSection(section),
          ),
      ],
    );
  }
}

class _DesktopNavItem extends StatefulWidget {
  const _DesktopNavItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  State<_DesktopNavItem> createState() => _DesktopNavItemState();
}

class _DesktopNavItemState extends State<_DesktopNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: _isHovered
                ? theme.colorScheme.primary.withAlpha(25)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: widget.onTap,
            style: TextButton.styleFrom(
              foregroundColor: _isHovered
                  ? theme.colorScheme.primary
                  : theme.textTheme.bodyMedium?.color,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
            child: Text(widget.title),
          ),
        ),
      ),
    );
  }
}

class _MobileMenuButton extends StatelessWidget {
  const _MobileMenuButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Scaffold.of(context).openEndDrawer(),
      icon: const Icon(Icons.menu_rounded),
      tooltip: 'Open navigation menu',
    );
  }
}

class _MobileNavigationDrawer extends StatelessWidget {
  const _MobileNavigationDrawer();

  @override
  Widget build(BuildContext context) {
    final nav = PortfolioNavigationScope.of(context);
    final theme = Theme.of(context);

    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      PortfolioConstants.initials,
                      style: TextStyle(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    PortfolioConstants.name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    tooltip: 'Close menu',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            const SizedBox(height: 8),
            for (final section in PortfolioSection.values)
              ListTile(
                leading: Icon(section.icon, size: 22),
                title: Text(
                  section.label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  nav.scrollToSection(section);
                },
              ),
          ],
        ),
      ),
    );
  }
}
