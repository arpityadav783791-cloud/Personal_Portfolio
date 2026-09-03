import 'package:flutter/material.dart';

import 'responsive.dart';

class ResponsiveSpacing {
  ResponsiveSpacing._();

  static double sectionVertical(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return 56;
    }

    if (Responsive.isTablet(context)) {
      return 72;
    }

    return 96;
  }
}
