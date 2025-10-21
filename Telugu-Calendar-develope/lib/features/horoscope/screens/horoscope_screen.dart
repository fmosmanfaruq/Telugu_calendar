import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';
import 'package:telugu_calender/features/horoscope/models/zodiac_model.dart';
import 'package:telugu_calender/features/horoscope/screens/horoscope_detail_screen.dart';

class HoroscopeScreen extends StatelessWidget {
  const HoroscopeScreen({super.key});

  String _getZodiacName(BuildContext context, String nameKey) {
    final l10n = AppLocalizations.of(context)!;
    switch (nameKey) {
      case 'mesha':
        return l10n.mesha;
      case 'vrishabha':
        return l10n.vrishabha;
      case 'mithuna':
        return l10n.mithuna;
      case 'karkataka':
        return l10n.karkataka;
      case 'simha':
        return l10n.simha;
      case 'kanya':
        return l10n.kanya;
      case 'tula':
        return l10n.tula;
      case 'vrischika':
        return l10n.vrischika;
      case 'dhanus':
        return l10n.dhanus;
      case 'makara':
        return l10n.makara;
      case 'kumbha':
        return l10n.kumbha;
      case 'meena':
        return l10n.meena;
      default:
        return nameKey;
    }
  }


  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final zodiacSigns = ZodiacSign.getAllSigns();
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.rasipalalu,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withValues(alpha: 0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.stars,
                    size: 48.sp,
                    color: Colors.white,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    l10n.selectYourRasi,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    l10n.dailyHoroscope,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ),
            
            // Zodiac Grid
            Padding(
              padding: EdgeInsets.all(12.r),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.85,
                ),
                itemCount: zodiacSigns.length,
                itemBuilder: (context, index) {
                  final zodiac = zodiacSigns[index];
                  return _buildZodiacCard(context, zodiac);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZodiacCard(BuildContext context, ZodiacSign zodiac) {
    final zodiacName = _getZodiacName(context, zodiac.nameKey);
    
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HoroscopeDetailScreen(
              zodiacSign: zodiac,
              zodiacName: zodiacName,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: zodiac.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: zodiac.color.withValues(alpha: 0.3),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Zodiac Icon
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  zodiac.icon,
                  style: TextStyle(
                    fontSize: 36.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            // Zodiac Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                zodiacName,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 2.r,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

