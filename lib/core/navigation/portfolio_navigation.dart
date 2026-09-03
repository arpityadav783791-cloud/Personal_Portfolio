import 'package:flutter/material.dart';

enum PortfolioSection {
  about('About', Icons.person_outline_rounded),
  skills('Skills', Icons.code_rounded),
  projects('Projects', Icons.layers_outlined),
  experience('Experience', Icons.work_outline_rounded),
  contact('Contact', Icons.mail_outline_rounded);

  const PortfolioSection(this.label, this.icon);
  final String label;
  final IconData icon;
}

class PortfolioNavigationScope extends InheritedWidget {
  const PortfolioNavigationScope({
    required this.controller,
    required super.child,
    super.key,
  });

  final PortfolioNavigationController controller;

  static PortfolioNavigationController of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<PortfolioNavigationScope>();
    assert(scope != null, 'No PortfolioNavigationScope found in context');
    return scope!.controller;
  }

  @override
  bool updateShouldNotify(PortfolioNavigationScope oldWidget) =>
      controller != oldWidget.controller;
}

class PortfolioNavigationController {
  final ScrollController scrollController = ScrollController();

  final Map<PortfolioSection, GlobalKey> sectionKeys = {
    for (final section in PortfolioSection.values) section: GlobalKey(),
  };

  void scrollToSection(PortfolioSection section) {
    final key = sectionKeys[section];
    final context = key?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0.05,
      );
    }
  }

  void scrollToTop() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  void dispose() {
    scrollController.dispose();
  }
}
