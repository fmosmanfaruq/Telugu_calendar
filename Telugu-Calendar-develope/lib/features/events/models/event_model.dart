import 'package:flutter/material.dart';

enum EventCategory {
  governmentHoliday,
  religiousFestival,
  regionalFestival,
  christianFestivals,
}

class EventModel {
  final DateTime date;
  final String nameKey; // Key for localization
  final String descriptionKey; // Key for localization
  final EventCategory category;
  final Color color;

  EventModel({
    required this.date,
    required this.nameKey,
    required this.descriptionKey,
    required this.category,
    required this.color,
  });

  static List<EventModel> getSampleEvents() {
    return [
      // January
      EventModel(
        date: DateTime(2025, 1, 14),
        nameKey: 'makaraSankranti',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.orange,
      ),
      EventModel(
        date: DateTime(2025, 1, 26),
        nameKey: 'republicDay',
        descriptionKey: 'publicHoliday',
        category: EventCategory.governmentHoliday,
        color: Colors.green,
      ),
      
      // February
      EventModel(
        date: DateTime(2025, 2, 26),
        nameKey: 'mahashivaratri',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.deepPurple,
      ),
      
      // March
      EventModel(
        date: DateTime(2025, 3, 14),
        nameKey: 'holi',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.pink,
      ),
      EventModel(
        date: DateTime(2025, 3, 30),
        nameKey: 'ugadi',
        descriptionKey: 'publicHoliday',
        category: EventCategory.regionalFestival,
        color: Colors.amber,
      ),
      
      // April
      EventModel(
        date: DateTime(2025, 4, 6),
        nameKey: 'sriRamaNavami',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.blue,
      ),
      
      // August
      EventModel(
        date: DateTime(2025, 8, 15),
        nameKey: 'independenceDay',
        descriptionKey: 'publicHoliday',
        category: EventCategory.governmentHoliday,
        color: Colors.green,
      ),
      EventModel(
        date: DateTime(2025, 8, 27),
        nameKey: 'vinayakaChaturthi',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.red,
      ),
      
      // October
      EventModel(
        date: DateTime(2025, 10, 2),
        nameKey: 'gandhiJayanti',
        descriptionKey: 'publicHoliday',
        category: EventCategory.governmentHoliday,
        color: Colors.green,
      ),
      EventModel(
        date: DateTime(2025, 10, 12),
        nameKey: 'dussehra',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.orange,
      ),
      EventModel(
        date: DateTime(2025, 10, 20),
        nameKey: 'diwali',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.deepOrange,
      ),
      
      // December
      EventModel(
        date: DateTime(2025, 12, 25),
        nameKey: 'christmas',
        descriptionKey: 'publicHoliday',
        category: EventCategory.religiousFestival,
        color: Colors.red,
      ),
    ];
  }
}

