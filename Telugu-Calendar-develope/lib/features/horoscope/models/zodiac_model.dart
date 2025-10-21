import 'package:flutter/material.dart';

class ZodiacSign {
  final String nameKey; // Key for localization
  final String icon; // Emoji or icon
  final Color color;
  final List<Color> gradientColors;

  ZodiacSign({
    required this.nameKey,
    required this.icon,
    required this.color,
    required this.gradientColors,
  });

  static List<ZodiacSign> getAllSigns() {
    return [
      ZodiacSign(
        nameKey: 'mesha',
        icon: '♈',
        color: Colors.red,
        gradientColors: [Colors.red.shade400, Colors.red.shade700],
      ),
      ZodiacSign(
        nameKey: 'vrishabha',
        icon: '♉',
        color: Colors.green,
        gradientColors: [Colors.green.shade400, Colors.green.shade700],
      ),
      ZodiacSign(
        nameKey: 'mithuna',
        icon: '♊',
        color: Colors.yellow.shade700,
        gradientColors: [Colors.yellow.shade400, Colors.yellow.shade700],
      ),
      ZodiacSign(
        nameKey: 'karkataka',
        icon: '♋',
        color: Colors.grey,
        gradientColors: [Colors.grey.shade400, Colors.grey.shade700],
      ),
      ZodiacSign(
        nameKey: 'simha',
        icon: '♌',
        color: Colors.orange,
        gradientColors: [Colors.orange.shade400, Colors.orange.shade700],
      ),
      ZodiacSign(
        nameKey: 'kanya',
        icon: '♍',
        color: Colors.brown,
        gradientColors: [Colors.brown.shade400, Colors.brown.shade700],
      ),
      ZodiacSign(
        nameKey: 'tula',
        icon: '♎',
        color: Colors.pink,
        gradientColors: [Colors.pink.shade400, Colors.pink.shade700],
      ),
      ZodiacSign(
        nameKey: 'vrischika',
        icon: '♏',
        color: Colors.deepPurple,
        gradientColors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
      ),
      ZodiacSign(
        nameKey: 'dhanus',
        icon: '♐',
        color: Colors.purple,
        gradientColors: [Colors.purple.shade400, Colors.purple.shade700],
      ),
      ZodiacSign(
        nameKey: 'makara',
        icon: '♑',
        color: Colors.teal,
        gradientColors: [Colors.teal.shade400, Colors.teal.shade700],
      ),
      ZodiacSign(
        nameKey: 'kumbha',
        icon: '♒',
        color: Colors.blue,
        gradientColors: [Colors.blue.shade400, Colors.blue.shade700],
      ),
      ZodiacSign(
        nameKey: 'meena',
        icon: '♓',
        color: Colors.cyan,
        gradientColors: [Colors.cyan.shade400, Colors.cyan.shade700],
      ),
    ];
  }
}

class HoroscopeData {
  final String prediction;
  final String luckyColor;
  final String luckyNumber;
  final String luckyTime;
  final String health;
  final String wealth;
  final String relationship;
  final String career;

  HoroscopeData({
    required this.prediction,
    required this.luckyColor,
    required this.luckyNumber,
    required this.luckyTime,
    required this.health,
    required this.wealth,
    required this.relationship,
    required this.career,
  });

  // Sample horoscope data
  static HoroscopeData getSampleData() {
    return HoroscopeData(
      prediction: 'Today is a favorable day for new beginnings. Your hard work will pay off soon.',
      luckyColor: 'Blue',
      luckyNumber: '7',
      luckyTime: '10:00 AM - 12:00 PM',
      health: 'Good. Maintain regular exercise routine.',
      wealth: 'Moderate. Avoid unnecessary expenses.',
      relationship: 'Excellent. Good time to strengthen bonds.',
      career: 'Very Good. New opportunities may arise.',
    );
  }
}

