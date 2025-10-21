import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized, responsive text styles for the app.
/// Update sizes here to scale the whole app consistently.
class AppTextStyles {
  // Header
  static TextStyle headerGreeting(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey[800],
      );
  static TextStyle headerTitle(BuildContext context) => TextStyle(
        fontSize: 23.sp,
        fontWeight: FontWeight.w800,
        color: const Color(0xFF1A1A1A),
      );

  // Sections
  static TextStyle sectionTitle(BuildContext context) => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );
  static TextStyle cardTagTitle(BuildContext context) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: Colors.grey[800],
      );

  // Carousel
  static TextStyle carouselLabel() => TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      );

  // Quick links
  static TextStyle quickLinkLabel() => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      );

  // Panchang - date widget
  static TextStyle dateChipSmall(BuildContext context) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: Colors.grey[700],
        height: 1,
      );
  static TextStyle dateChipMedium(BuildContext context) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: Colors.grey[700],
        height: 1,
      );
  static TextStyle dateDayNumber(BuildContext context) => TextStyle(
        fontSize: 19.sp,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).primaryColor,
        height: 1,
      );

  // Panchang - timing items
  static TextStyle timingLabel() => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white.withOpacity(0.9),
      );
  static TextStyle timingValue() => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      );

  // Panchang - compact info rows
  static TextStyle infoLabel() => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );
  static TextStyle infoValue() => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.blueAccent,
      ).copyWith(fontSize: 14.sp);

  // Auspicious timing chip
  static TextStyle chipLabel(Color color) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: color,
      );
  static TextStyle chipValue() => TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey[800],
      );

  // Events
  static TextStyle eventDateDay(Color color) => TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w800,
        color: color,
      );
  static TextStyle eventDateMonth(Color color) => TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );
}
