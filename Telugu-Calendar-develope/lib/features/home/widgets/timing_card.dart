import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// পুনঃব্যবহারযোগ্য কার্ড 위젯, যা প্রতিটি আইটেমের জন্য একই ডিজাইন নিশ্চিত করে
class TimingInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String time;

  const TimingInfoCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // প্রতিটি আইটেমের জন্য আলাদা কন্টেইনার এবং ডিজাইন
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Color(0xFFFF6A88), Color(0xFFFF99AC)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFF6A88).withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // বাম পাশে আইকন
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 12), // আইকন এবং টেক্সটের মধ্যে ফাঁকা জায়গা
          // ডান পাশে টেক্সট
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 10,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
