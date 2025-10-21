import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';
import 'package:telugu_calender/features/horoscope/models/zodiac_model.dart';
import 'package:telugu_calender/features/horoscope_new/models/zodiac_model.dart';

class HoroscopeDetailScreenNew extends StatelessWidget {
  final ZodiacSignNew zodiacSign;
  final String zodiacName;

  const HoroscopeDetailScreenNew({
    super.key,
    required this.zodiacSign,
    required this.zodiacName,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final horoscope = HoroscopeData.getSampleData();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        slivers: [
          // App Bar with Gradient
          SliverAppBar(
            expandedHeight: 200.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                zodiacName,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      blurRadius: 4.r,
                    ),
                  ],
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: zodiacSign.gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    zodiacSign.icon,
                    style: TextStyle(
                      fontSize: 100.sp,
                      color: Colors.white.withValues(alpha: 0.3),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Daily Prediction Card
                  _buildPredictionCard(context, l10n, horoscope),
                  SizedBox(height: 16.h),

                  // Lucky Details
                  _buildLuckyDetailsCard(context, l10n, horoscope),
                  SizedBox(height: 16.h),

                  // Life Aspects
                  _buildLifeAspectsCard(context, l10n, horoscope),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPredictionCard(BuildContext context, AppLocalizations l10n, HoroscopeData horoscope) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.auto_awesome,
                color: zodiacSign.color,
                size: 24.sp,
              ),
              SizedBox(width: 8.w),
              Text(
                l10n.dailyHoroscope,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: zodiacSign.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            horoscope.prediction,
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.5,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLuckyDetailsCard(BuildContext context, AppLocalizations l10n, HoroscopeData horoscope) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lucky Details',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: zodiacSign.color,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildLuckyItem(
                  context,
                  l10n.luckyColor,
                  horoscope.luckyColor,
                  Icons.palette,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildLuckyItem(
                  context,
                  l10n.luckyNumber,
                  horoscope.luckyNumber,
                  Icons.filter_7,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildLuckyItem(
            context,
            l10n.luckyTime,
            horoscope.luckyTime,
            Icons.access_time,
          ),
        ],
      ),
    );
  }

  Widget _buildLuckyItem(BuildContext context, String label, String value, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: zodiacSign.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16.sp, color: zodiacSign.color),
              SizedBox(width: 6.w),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: zodiacSign.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLifeAspectsCard(BuildContext context, AppLocalizations l10n, HoroscopeData horoscope) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Life Aspects',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: zodiacSign.color,
            ),
          ),
          SizedBox(height: 16.h),
          _buildAspectItem(context, l10n.health, horoscope.health, Icons.favorite, Colors.red),
          SizedBox(height: 12.h),
          _buildAspectItem(context, l10n.wealth, horoscope.wealth, Icons.account_balance_wallet, Colors.green),
          SizedBox(height: 12.h),
          _buildAspectItem(context, l10n.relationship, horoscope.relationship, Icons.people, Colors.pink),
          SizedBox(height: 12.h),
          _buildAspectItem(context, l10n.career, horoscope.career, Icons.work, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildAspectItem(BuildContext context, String label, String value, IconData icon, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(icon, size: 20.sp, color: color),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey.shade600,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
