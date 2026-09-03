import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double maxContentWidth = 1200;

  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static bool isMobile(BuildContext context) {
    return width(context) < mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final screenWidth = width(context);

    return screenWidth >= mobileBreakpoint && screenWidth < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return width(context) >= tabletBreakpoint;
  }

  static double horizontalPadding(BuildContext context) {
    final screenWidth = width(context);

    if (screenWidth < mobileBreakpoint) {
      return 20;
    }

    if (screenWidth < tabletBreakpoint) {
      return 32;
    }

    return 48;
  }
}
