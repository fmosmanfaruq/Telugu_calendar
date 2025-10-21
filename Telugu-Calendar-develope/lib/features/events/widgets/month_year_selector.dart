import 'package:flutter/material.dart';

import '../../../core/config/app_theme.dart';

class MonthYearSelector extends StatelessWidget {
  const MonthYearSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: _buildSelector(context, "2025"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildSelector(context, "ఆగస్టు"),
          ),
        ],
      ),
    );
  }

  Widget _buildSelector(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
          const Icon(Icons.arrow_drop_down, color: AppColors.secondaryText),
        ],
      ),
    );
  }
}