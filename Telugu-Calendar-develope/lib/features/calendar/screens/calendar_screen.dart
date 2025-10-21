import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:telugu_calender/core/config/app_text_styles.dart';
import 'package:telugu_calender/core/config/app_theme.dart';
import 'package:telugu_calender/core/constants/asset_paths.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';
import 'package:telugu_calender/features/events/models/event_model.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _toDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;

  // Sample festival data
  final Map<DateTime, List<String>> _festivals = {
    DateTime(2025, 1, 14): ['makaraSankranti'],
    DateTime(2025, 1, 26): ['republicDay'],
    DateTime(2025, 3, 14): ['holi'],
    DateTime(2025, 3, 30): ['ugadi'],
    DateTime(2025, 4, 6): ['sriRamaNavami'],
    DateTime(2025, 8, 15): ['independenceDay'],
    DateTime(2025, 8, 27): ['vinayakaChaturthi'],
    DateTime(2025, 10, 2): ['gandhiJayanti'],
    DateTime(2025, 10, 12): ['dussehra'],
    DateTime(2025, 10, 20): ['diwali'],
    DateTime(2025, 12, 25): ['christmas'],
  };

  List<EventModel> get _allEvents => EventModel.getSampleEvents();

  List<EventModel> get _filteredEvents {
    return _allEvents.where((event) {
      final matchesMonth = event.date.month == _selectedMonth;
      final matchesYear = event.date.year == _selectedYear;
      final matchesCategory = event.category == EventCategory.governmentHoliday;
      return matchesMonth && matchesYear && matchesCategory;
    }).toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  String _getCategoryName(BuildContext context, EventCategory category) {
    final l10n = AppLocalizations.of(context)!;
    switch (category) {
      case EventCategory.governmentHoliday:
        return l10n.nationalHolidays;
      case EventCategory.religiousFestival:
        return l10n.religiousFestivals;
      case EventCategory.regionalFestival:
        return l10n.regionalFestivals;
      case EventCategory.christianFestivals:
        return l10n.christianFestivals;
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  List<String> _getEventsForDay(DateTime day) {
    return _festivals[DateTime(day.year, day.month, day.day)] ?? [];
  }

  String _getMonthName(BuildContext context, int month) {
    final l10n = AppLocalizations.of(context)!;
    final months = [
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
    return months[month - 1];
  }

  String _getDayName(BuildContext context, int weekday) {
    final l10n = AppLocalizations.of(context)!;
    final days = [
      l10n.monday,
      l10n.tuesday,
      l10n.wednesday,
      l10n.thursday,
      l10n.friday,
      l10n.saturday,
      l10n.sunday,
    ];
    return days[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final monthName = _getMonthName(context, _focusedDay.month);
    final currentLocale = Localizations.localeOf(context).toString();
    return Scaffold(
      backgroundColor: Colors.grey[50],
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
        title: Text(
          l10n.calendar,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Calendar Card
            Container(
              margin: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    tooltip: l10n.previousMonth,
                    onPressed: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month - 1,
                          _focusedDay.day,
                        );
                      });
                    },
                  ),
                  Text(
                    '$monthName - ${_focusedDay.year}',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.today),
                        tooltip: l10n.today,
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime.now();
                            _selectedDay = DateTime.now();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right),
                        tooltip: l10n.nextMonth,
                        onPressed: () {
                          setState(() {
                            _focusedDay = DateTime(
                              _focusedDay.year,
                              _focusedDay.month + 1,
                              _focusedDay.day,
                            );
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(12.r),
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
              child: TableCalendar(
                locale: currentLocale,
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: _onDaySelected,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                  setState(() {});
                },
                eventLoader: _getEventsForDay,
                headerVisible: false,
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: isSameDay(_toDay, _focusedDay)
                        ? AppColors.primary
                        : AppColors.secondaryText,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    color: AppColors.holidayRed,
                    fontSize: 14.sp,
                  ),
                  defaultTextStyle: TextStyle(fontSize: 14.sp),
                  outsideTextStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14.sp,
                  ),
                  markerDecoration: const BoxDecoration(
                    color: AppColors.accent,
                    shape: BoxShape.circle,
                  ),
                  markersMaxCount: 1,
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekendStyle: TextStyle(
                    color: AppColors.holidayRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                  weekdayStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),

            // Selected Date Details
            if (_selectedDay != null) _buildSelectedDateDetails(context),
            _buildCompactDetailsCard(context),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              padding: EdgeInsets.all(8.r),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    l10n.holidays,
                    style: TextStyle(
                      color: AppColors.blueColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _filteredEvents.map((event) {
                      return _buildEventCard(context, event);
                    }).toList(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, EventModel event) {
    final l10n = AppLocalizations.of(context)!;

    // Get localized event name
    String eventName;
    switch (event.nameKey) {
      case 'republicDay':
        eventName = l10n.republicDay;
        break;
      case 'independenceDay':
        eventName = l10n.independenceDay;
        break;
      case 'gandhiJayanti':
        eventName = l10n.gandhiJayanti;
        break;
      case 'ugadi':
        eventName = l10n.ugadi;
        break;
      case 'sriRamaNavami':
        eventName = l10n.sriRamaNavami;
        break;
      case 'vinayakaChaturthi':
        eventName = l10n.vinayakaChaturthi;
        break;
      case 'dussehra':
        eventName = l10n.dussehra;
        break;
      case 'diwali':
        eventName = l10n.diwali;
        break;
      case 'christmas':
        eventName = l10n.christmas;
        break;
      case 'makaraSankranti':
        eventName = l10n.makaraSankranti;
        break;
      case 'mahashivaratri':
        eventName = l10n.mahashivaratri;
        break;
      case 'holi':
        eventName = l10n.holi;
        break;
      default:
        eventName = event.nameKey;
    }

    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Row(
        children: [
          // Date Box
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getMonthName(context, event.date.month),
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  '${event.date.day}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          // Event Details
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ': $eventName',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedDateDetails(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dayName = _getDayName(context, _selectedDay!.weekday);
    final monthName = _getMonthName(context, _selectedDay!.month);
    final events = _getEventsForDay(_selectedDay!);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
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
            l10n.selectedDateDetails,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 20.sp, color: AppColors.primary),
              SizedBox(width: 8.w),
              Text(
                '$dayName, $monthName ${_selectedDay!.day}, ${_selectedDay!.year}',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          if (events.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Divider(height: 1.h),
            SizedBox(height: 12.h),
            ...events.map((event) {
              final l10n = AppLocalizations.of(context)!;

              // Get localized event name
              String eventName;
              switch (event) {
                case 'republicDay':
                  eventName = l10n.republicDay;
                  break;
                case 'independenceDay':
                  eventName = l10n.independenceDay;
                  break;
                case 'gandhiJayanti':
                  eventName = l10n.gandhiJayanti;
                  break;
                case 'ugadi':
                  eventName = l10n.ugadi;
                  break;
                case 'sriRamaNavami':
                  eventName = l10n.sriRamaNavami;
                  break;
                case 'vinayakaChaturthi':
                  eventName = l10n.vinayakaChaturthi;
                  break;
                case 'dussehra':
                  eventName = l10n.dussehra;
                  break;
                case 'diwali':
                  eventName = l10n.diwali;
                  break;
                case 'christmas':
                  eventName = l10n.christmas;
                  break;
                case 'makaraSankranti':
                  eventName = l10n.makaraSankranti;
                  break;
                case 'mahashivaratri':
                  eventName = l10n.mahashivaratri;
                  break;
                case 'holi':
                  eventName = l10n.holi;
                  break;
                default:
                  eventName = event;
              }

              return Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  children: [
                    Icon(Icons.celebration,
                        size: 18.sp, color: AppColors.accent),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        eventName,
                        style: TextStyle(fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ],
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
                        l10n.tithi, 'Saptami upto 04:31 PM, Ashtami '),
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

  Widget _compactInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              '$label:',
              style: AppTextStyles.infoLabel(),
            ),
          ),
          Expanded(
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

  Widget _buildModernCard({required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      padding: EdgeInsets.all(8.r),
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
