import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telugu_calender/core/constants/app_colors.dart';
import 'package:telugu_calender/core/constants/asset_paths.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';
import 'package:telugu_calender/features/horoscope_new/models/zodiac_model.dart';
import 'package:telugu_calender/features/horoscope_new/screens/horoscope_detail_screen.dart';

class HoroscopeScreenNew extends StatelessWidget {
  const HoroscopeScreenNew({super.key});

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
    final zodiacSigns = ZodiacSignNew.getAllSigns();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: SvgPicture.asset(
                  AssetsPaths.defaultBackIcon,
                  fit: BoxFit.fitHeight,
                ))),
        backgroundColor: AppColors.pinkColor,
        title: Text(
          l10n.horoscope,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Zodiac Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.h),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 12.h,
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
    );
  }

  Widget _buildZodiacCard(BuildContext context, ZodiacSignNew zodiac) {
    final zodiacName = _getZodiacName(context, zodiac.nameKey);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HoroscopeDetailScreenNew(
              zodiacSign: zodiac,
              zodiacName: zodiacName,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        width: 56.h,
        height: 56.h,
        child: Center(
          child: Image.asset(zodiac.image),
        ),
      ),
    );
  }
}
