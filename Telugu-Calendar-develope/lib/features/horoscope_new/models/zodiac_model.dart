import 'package:flutter/material.dart';
import 'package:telugu_calender/core/constants/asset_paths.dart';

class ZodiacSignNew {
  final String nameKey; // Key for localization
  final String image; // image
  final String icon; // icon
  final Color color;
  final List<Color> gradientColors;

  ZodiacSignNew({
    required this.nameKey,
    required this.image,
    required this.color,
    required this.icon,
    required this.gradientColors,
  });

  static List<ZodiacSignNew> getAllSigns() {
    return [
      ZodiacSignNew(
        nameKey: 'mesha',
        image: AssetsPaths.meshaImage,
        color: Colors.red,
        icon: '♈',
        gradientColors: [Colors.red.shade400, Colors.red.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'vrishabha',
        image: AssetsPaths.vrishabhaImage,
        icon: '♉',
        color: Colors.green,
        gradientColors: [Colors.green.shade400, Colors.green.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'mithuna',
        icon: '♊',
        image: AssetsPaths.mithunaImage,
        color: Colors.yellow.shade700,
        gradientColors: [Colors.yellow.shade400, Colors.yellow.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'karkataka',
        icon: '♋',
        image: AssetsPaths.karkatakaImage,
        color: Colors.grey,
        gradientColors: [Colors.grey.shade400, Colors.grey.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'simha',
        icon: '♌',
        image: AssetsPaths.simhaImage,
        color: Colors.orange,
        gradientColors: [Colors.orange.shade400, Colors.orange.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'kanya',
        icon: '♍',
        image: AssetsPaths.kanyaImage,
        color: Colors.brown,
        gradientColors: [Colors.brown.shade400, Colors.brown.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'tula',
        icon: '♎',
        image: AssetsPaths.tulaImage,
        color: Colors.pink,
        gradientColors: [Colors.pink.shade400, Colors.pink.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'vrischika',
        icon: '♏',
        image: AssetsPaths.vrischikaImage,
        color: Colors.deepPurple,
        gradientColors: [Colors.deepPurple.shade400, Colors.deepPurple.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'dhanus',
        icon: '♐',
        image: AssetsPaths.dhanusImage,
        color: Colors.purple,
        gradientColors: [Colors.purple.shade400, Colors.purple.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'makara',
        icon: '♑',
        image: AssetsPaths.makaraImage,
        color: Colors.teal,
        gradientColors: [Colors.teal.shade400, Colors.teal.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'kumbha',
        icon: '♒',
        image: AssetsPaths.kumbhaImage,
        color: Colors.blue,
        gradientColors: [Colors.blue.shade400, Colors.blue.shade700],
      ),
      ZodiacSignNew(
        nameKey: 'meena',
        icon: '♓',
        image: AssetsPaths.meenaImage,
        color: Colors.cyan,
        gradientColors: [Colors.cyan.shade400, Colors.cyan.shade700],
      ),
    ];
  }
}

class HoroscopeDataNew {
  final String prediction;
  final String luckyColor;
  final String luckyNumber;
  final String luckyTime;
  final String health;
  final String wealth;
  final String relationship;
  final String career;

  HoroscopeDataNew({
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
  static HoroscopeDataNew getSampleData() {
    return HoroscopeDataNew(
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

