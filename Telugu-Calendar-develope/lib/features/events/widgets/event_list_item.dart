import 'package:flutter/material.dart';
import 'package:telugu_calender/core/config/app_theme.dart';

class EventListItem extends StatelessWidget {
  final String date;
  final String day;
  final String name;
  final String description;

  const EventListItem({
    super.key,
    required this.date,
    required this.day,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            SizedBox(
              width: 60,
              child: Column(
                children: [
                  Text(
                    date,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.holidayRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    day,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.holidayRed,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
