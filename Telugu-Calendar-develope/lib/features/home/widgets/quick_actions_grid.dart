import 'package:flutter/material.dart';
import 'package:telugu_calender/core/config/app_theme.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildActionItem(context, Icons.calendar_month, "క్యాలెండర్"),
          _buildActionItem(context, Icons.beach_access, "సెలవులు"),
          _buildActionItem(context, Icons.celebration, "పండుగలు"),
          _buildActionItem(context, Icons.brightness_4, "రాశి ఫలాలు"),
        ],
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primary.withOpacity(0.1),
          child: Icon(icon, size: 30, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
