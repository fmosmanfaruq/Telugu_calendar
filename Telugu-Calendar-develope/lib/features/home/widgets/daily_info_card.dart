import 'package:flutter/material.dart';
import 'package:telugu_calender/core/config/app_theme.dart';

class DailyInfoCard extends StatelessWidget {
  const DailyInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  '20',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('శనివారం', style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
            const VerticalDivider(width: 32, thickness: 1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(
                    context,
                    Icons.wb_sunny_outlined,
                    'సూర్యోదయం',
                    '05:51 AM',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    context,
                    Icons.nightlight_outlined,
                    'సూర్యాస్తమయం',
                    '06:00 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, color: AppColors.accent, size: 20),
        const SizedBox(width: 8),
        Text('$label:', style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
