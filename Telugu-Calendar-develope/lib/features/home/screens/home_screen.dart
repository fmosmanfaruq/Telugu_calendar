import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telugu_calender/core/providers/language_provider.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';

import 'package:telugu_calender/features/calendar/screens/calendar_screen.dart';
import 'package:telugu_calender/features/events/screens/events_screen.dart';
import 'package:telugu_calender/features/horoscope/screens/horoscope_screen.dart';
import 'package:telugu_calender/core/config/app_text_styles.dart';
import 'package:telugu_calender/features/horoscope_new/screens/horoscope_screen.dart';

class HomeScreen extends StatefulWidget {
  final LanguageProvider languageProvider;
  final Function(int)? onTabSelected;

  const HomeScreen({
    super.key,
    required this.languageProvider,
    this.onTabSelected,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _carouselItems = const [
    _CarouselItem(
      imageUrl: 'https://picsum.photos/seed/telugu1/1200/500',
      label: 'Promotions / Festival Banner',
    ),
    _CarouselItem(
      imageUrl: 'https://picsum.photos/seed/telugu2/1200/500',
      label: 'This will be an Image',
    ),
    _CarouselItem(
      imageUrl: 'https://picsum.photos/seed/telugu3/1200/500',
      label: 'Custom Content / Ads',
    ),
  ];

  static const int _initialPage = 10000;

  late PageController _carouselController;
  int _currentPage = _initialPage;
  Timer? _carouselTimer;

  final DateTime selectedDate = DateTime(2025, 11, 20);
  final String sunrise = '05:51 AM';
  final String sunset = '06:00 PM';
  final String moonrise = '12:08 PM';
  final String moonset = '11:35 PM';

  @override
  void initState() {
    super.initState();
    _carouselController = PageController(
      viewportFraction: 0.92,
      initialPage: _initialPage,
    );
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _carouselTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_carouselController.hasClients) return;
      _carouselController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 420),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _carouselTimer?.cancel();
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Color(0xFFECA9C0),
        ),
      ),
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              color: const Color.fromARGB(255, 239, 169, 193),
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
                vertical: 8.0.h,
              ),
              child: _buildHeader(context),
            ),

            // Main Content - Now Scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),

                    _buildCarousel(context),

                    SizedBox(height: 5.h),

                    _buildQuickLinks(context),

                    SizedBox(height: 5.h),

                    // Flexible cards that can expand as needed
                    _buildTodayPanchangCard(context),

                    SizedBox(height: 8.h),

                    _buildCompactDetailsCard(context),

                    SizedBox(height: 80.h), // Extra padding at bottom
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130.h, // Stable height
          child: PageView.builder(
            controller: _carouselController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              final itemIndex = index % _carouselItems.length;
              return _carouselItems[itemIndex];
            },
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_carouselItems.length, (index) {
            final bool active = (_currentPage % _carouselItems.length) == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              height: 5.h,
              width: active ? 15.w : 5.w,
              decoration: BoxDecoration(
                color: active
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12.r),
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.goodMorning,
                style: AppTextStyles.headerGreeting(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 1.h),
              Text(
                l10n.teluguCalendar,
                style: AppTextStyles.headerTitle(context),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeaderIconButton(Icons.translate, onPressed: () {
              widget.languageProvider.toggleLanguage();
            }),
            SizedBox(width: 4.w),
            _buildHeaderIconButton(Icons.search),
            SizedBox(width: 4.w),
            _buildHeaderIconButton(Icons.share_outlined),
          ],
        ),
      ],
    );
  }

  Widget _buildHeaderIconButton(IconData icon, {VoidCallback? onPressed}) {
    return Container(
      width: 34.r,
      height: 34.r,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1.r,
            blurRadius: 8.r,
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, color: Colors.grey[800], size: 18.sp),
        onPressed: onPressed ?? () {},
      ),
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      height: 95.h,
      child: Row(
        children: [
          Expanded(
            child: _QuickLinkCard(
              imagePath: 'assets/images/codicon_calendar.png',
              label: l10n.calendar,
              color: Theme.of(context).primaryColor,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CalendarScreen()),
              ),
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: _QuickLinkCard(
              imagePath: 'assets/images/holidays.png',
              label: l10n.festivalsAndHolidays,
              color: Colors.orange.shade700,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const EventsScreen()),
              ),
            ),
          ),
          // SizedBox(width: 6.w),
          // Expanded(
          //   child: _QuickLinkCard(
          //     imagePath: 'assets/images/Party.png',
          //     label: l10n.festivals,
          //     color: Colors.pink.shade500,
          //     onTap: () => Navigator.of(context).push(
          //       MaterialPageRoute(builder: (_) => const EventsScreen()),
          //     ),
          //   ),
          // ),
          SizedBox(width: 6.w),
          Expanded(
            child: _QuickLinkCard(
              imagePath: 'assets/images/Horoscope.png',
              label: l10n.rasipalalu,
              color: Colors.deepPurple.shade500,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HoroscopeScreenNew()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayPanchangCard(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final monthNames = [
      l10n.january,
      l10n.february,
      l10n.march,
      l10n.april,
      l10n.may,
      l10n.june,
      l10n.july,
      l10n.august,
      l10n.september,
      l10n.october,
      l10n.november,
      l10n.december,
    ];
    final weekdayNames = [
      l10n.monday,
      l10n.tuesday,
      l10n.wednesday,
      l10n.thursday,
      l10n.friday,
      l10n.saturday,
      l10n.sunday,
    ];
    final monthName = monthNames[selectedDate.month - 1];
    final dayName = weekdayNames[(selectedDate.weekday - 1) % 7];
    final year = selectedDate.year.toString();
    final day = selectedDate.day.toString().padLeft(2, '0');

    return _buildModernCard(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(6.r),
              ),
              /*child: Text(
                l10n.todayPanchang,
                style: AppTextStyles.cardTagTitle(context),
              ),*/
            ),
            SizedBox(height: 6.h),
            // Flexible layout that adapts to content
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColor.withOpacity(0.75),
                    theme.primaryColor.withOpacity(0.45),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Date section and Sunrise/Moonrise - Row layout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 95.w,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade200,
                            width: 1.w,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.06),
                              blurRadius: 8.r,
                              offset: Offset(0, 3.h),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _dateChip(
                                year,
                                theme,
                                AppTextStyles.dateChipSmall(context).fontSize ??
                                    11.sp),
                            SizedBox(height: 4.h),
                            _dateChip(
                                monthName,
                                theme,
                                AppTextStyles.dateChipMedium(context)
                                        .fontSize ??
                                    12.sp),
                            SizedBox(height: 4.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                color: theme.primaryColor.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(
                                  color: theme.primaryColor.withOpacity(0.2),
                                ),
                              ),
                              child: Text(
                                day,
                                style: AppTextStyles.dateDayNumber(context),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            _dateChip(
                                dayName,
                                theme,
                                AppTextStyles.dateChipSmall(context).fontSize ??
                                    11.sp),
                          ],
                        ),
                      ),
                      SizedBox(width: 8.w),
                    ],
                  ),
                  SizedBox(width: 8.w),
                  SizedBox(height: 10.h),

                  // Sunrise/Moonrise section - right side
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w, // Match Sunset/Moonset padding
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6A88), Color(0xFFFF99AC)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6A88).withOpacity(0.25),
                          blurRadius: 8.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // Match Sunset/Moonset layout
                      children: [
                        Flexible(
                          child: _buildTimingItem(
                            CupertinoIcons.sunrise_fill,
                            l10n.sunrise,
                            sunrise,
                          ),
                        ),
                        Flexible(
                          child: _buildTimingItem(
                            CupertinoIcons.moon_fill,
                            l10n.moonrise,
                            moonrise,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                  // Sunset/Moonset section
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF6A88), Color(0xFFFF99AC)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6A88).withOpacity(0.25),
                          blurRadius: 8.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: _buildTimingItem(
                            CupertinoIcons.sunset_fill,
                            l10n.sunset,
                            sunset,
                          ),
                        ),
                        Flexible(
                          child: _buildTimingItem(
                            CupertinoIcons.moon_stars_fill,
                            l10n.moonset,
                            moonset,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateChip(String text, ThemeData theme, double fontSize) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildCompactDetailsCard(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return _buildModernCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Panchangam Details Section
          Container(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_view_day,
                      color: theme.primaryColor,
                      size: 20.sp,
                    ),
                    SizedBox(width: 6.w),
                    Flexible(
                      child: Text(
                        l10n.todayPanchang,
                        style: AppTextStyles.sectionTitle(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _compactInfoRow(
                        l10n.tithi, ' Saptami upto 04:31 PM, Ashtami'),
                    SizedBox(height: 3.h),
                    _compactInfoRow(
                        l10n.nakshatram, ' Mula upto 03:13 AM, Purva Ashadha'),
                    SizedBox(height: 3.h),
                    // _compactInfoRow(l10n.arambham, 'Ratri 23:16'),
                    // SizedBox(height: 3.h),
                    // _compactInfoRow(l10n.samapti, 'Ratri 24:21'),
                  ],
                ),
              ],
            ),
          ),
          // Divider
          Container(
            height: 1.h,
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            color: Colors.grey.shade300,
          ),
          // Auspicious Timings Section
          Container(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.clock_fill,
                      color: theme.primaryColor,
                      size: 20.sp,
                    ),
                    SizedBox(width: 6.w),
                    Flexible(
                      child: Text(
                        l10n.auspiciousTimings,
                        style: AppTextStyles.sectionTitle(context),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _timingChip(
                            l10n.rahukalam,
                            '1:30-3:00',
                            Colors.red.shade600,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: _timingChip(
                            l10n.yamagandam,
                            '6:00-7:30',
                            Colors.orange.shade700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Expanded(
                          child: _timingChip(
                            l10n.varjyam,
                            '01:21-02:52',
                            Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: _timingChip(
                            l10n.durmuhurtam,
                            '10:53-11:45',
                            Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimingItem(IconData icon, String label, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 20.sp),
          SizedBox(width: 6.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyles.timingLabel(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                time,
                style: AppTextStyles.timingValue(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _timingChip(String label, String time, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.chipLabel(color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2.h),
          Text(
            time,
            style: AppTextStyles.chipValue(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _compactInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              child: Text(
                '$label:',
                style: AppTextStyles.infoLabel(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: AppTextStyles.infoValue(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200, width: 1.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            spreadRadius: 1.r,
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _CarouselItem extends StatelessWidget {
  final String imageUrl;
  final String? label;
  const _CarouselItem({required this.imageUrl, this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.r,
      shadowColor: Colors.black.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Network image with loading & error handling
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Container(
                  color: Colors.grey.shade200,
                  child: Center(
                    child: SizedBox(
                      height: 20.sp,
                      width: 20.sp,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stack) => Container(
                color: Colors.grey.shade300,
                child: Icon(Icons.broken_image_outlined,
                    size: 28.sp, color: Colors.grey.shade700),
              ),
            ),
            // Subtle gradient overlay at bottom for caption contrast
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 36.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.45)
                    ],
                  ),
                ),
              ),
            ),
            if (label != null)
              Positioned(
                left: 12.w,
                right: 12.w,
                bottom: 8.h,
                child: Text(
                  label!,
                  style: AppTextStyles.carouselLabel(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _QuickLinkCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _QuickLinkCard({
    required this.imagePath,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.r,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                color: Colors.white,
                height: 24.sp,
                width: 24.sp,
              ),
              SizedBox(height: 3.h),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.quickLinkLabel(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
