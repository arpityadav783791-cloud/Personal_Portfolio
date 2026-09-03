import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive/responsive.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Responsive.maxContentWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
