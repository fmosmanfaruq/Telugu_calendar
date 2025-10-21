import 'package:flutter/material.dart';

class PanchangamDetails extends StatelessWidget {
  const PanchangamDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("పంచాంగం", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
             const Divider(height: 24),
            _buildDetailRow(context, 'తిథి', 'బహుళ అష్టమి (బహుళ అష్టమి తిథి)'),
            _buildDetailRow(context, 'నక్షత్రం', 'కృత్తిక నక్షత్రం'),
            _buildDetailRow(context, 'రాహుకాలం', 'మధ్యాహ్నం 1:30 నుండి 3:00 వరకు'),
            _buildDetailRow(context, 'యమగండం', 'ఉదయం 6:00 నుండి 7:30 వరకు'),
            _buildDetailRow(context, 'వర్జ్యం', 'మధ్యాహ్నం 01:21 నుండి 02:52 వరకు'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text('$label:', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value, style: Theme.of(context).textTheme.bodyLarge)),
        ],
      ),
    );
  }
}