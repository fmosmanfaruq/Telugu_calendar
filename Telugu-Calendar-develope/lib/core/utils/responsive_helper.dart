import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 360;
  }

  static bool isMediumScreen(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 360 && width < 400;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 400;
  }

  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) {
      return baseSize * 0.9;
    } else if (width >= 400) {
      return baseSize * 1.05;
    }
    return baseSize;
  }

  static double getResponsiveHeight(BuildContext context, double baseHeight) {
    final height = MediaQuery.of(context).size.height;
    if (height < 700) {
      return baseHeight * 0.9;
    } else if (height >= 900) {
      return baseHeight * 1.1;
    }
    return baseHeight;
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) {
      return const EdgeInsets.symmetric(horizontal: 8.0);
    } else if (width >= 400) {
      return const EdgeInsets.symmetric(horizontal: 16.0);
    }
    return const EdgeInsets.symmetric(horizontal: 12.0);
  }
}

