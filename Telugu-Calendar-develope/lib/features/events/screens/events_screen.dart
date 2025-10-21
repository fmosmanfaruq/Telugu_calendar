import 'package:flutter/material.dart';
import 'package:telugu_calender/core/config/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telugu_calender/core/l10n/app_localizations.dart';
import 'package:telugu_calender/features/events/models/event_model.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  EventCategory? _selectedCategory;

  late List<int> _years;
  static const int _startYear = 2000;
  final int _currentYear = DateTime.now().year;

  List<EventModel> get _allEvents => EventModel.getSampleEvents();

  List<EventModel> get _filteredEvents {
    return _allEvents.where((event) {
      final matchesMonth = event.date.month == _selectedMonth;
      final matchesYear = event.date.year == _selectedYear;
      final matchesCategory = _selectedCategory == null || event.category == _selectedCategory;
      return matchesMonth && matchesYear && matchesCategory;
    }).toList()..sort((a, b) => a.date.compareTo(b.date));
  }

  String _getMonthName(BuildContext context, int month) {
    final l10n = AppLocalizations.of(context)!;
    final months = [
      l10n.january, l10n.february, l10n.march, l10n.april,
      l10n.may, l10n.june, l10n.july, l10n.august,
      l10n.september, l10n.october, l10n.november, l10n.december,
    ];
    return months[month - 1];
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
    _years = List<int>.generate(
        _currentYear - _startYear + 1,
            (i) => _startYear + i
    ).reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.festivalsAndHolidays,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Month/Year Selector
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Row(
              children: [
                Expanded(
                  child: _buildMonthYearSelector(context),
                ),
              ],
            ),
          ),

          // Category Filter
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip(context, null, l10n.allCategories),
                  SizedBox(width: 8.w),
                  _buildCategoryChip(
                    context,
                    EventCategory.governmentHoliday,
                    l10n.nationalHolidays,
                  ),
                  SizedBox(width: 8.w),
                  _buildCategoryChip(
                    context,
                    EventCategory.religiousFestival,
                    l10n.religiousFestivals,
                  ),
                  SizedBox(width: 8.w),
                  _buildCategoryChip(
                    context,
                    EventCategory.regionalFestival,
                    l10n.regionalFestivals,
                  ),
                  SizedBox(width: 8.w),
                  _buildCategoryChip(
                    context,
                    EventCategory.christianFestivals,
                    l10n.christianFestivals,
                  ),
                ],
              ),
            ),
          ),

          // Events List
          Expanded(
            child: _filteredEvents.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy,
                          size: 64.sp,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          l10n.noEventsFound,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    itemCount: _filteredEvents.length,
                    itemBuilder: (context, index) {
                      return _buildEventCard(context, _filteredEvents[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthYearSelector(BuildContext context) {
    final monthName = _getMonthName(context, _selectedMonth);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            value: _selectedYear,
            menuMaxHeight: 400.h,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            iconEnabledColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            elevation: 0,
            dropdownColor: Colors.black,
            onChanged: (int? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedYear = newValue;
                });
              }
            },
            items: _years.map<DropdownMenuItem<int>>((int year) {
              return DropdownMenuItem<int>(
                value: year,
                child: Text(year.toString(), style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),),
              );
            }).toList(),
          ),
        ),
        // Text(
        //   '$_selectedYear',
        //   style: TextStyle(
        //     color: Colors.white,
        //     fontSize: 18.sp,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (_selectedMonth == 1) {
                    _selectedMonth = 12;
                    _selectedYear--;
                  } else {
                    _selectedMonth--;
                  }
                });
              },
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                monthName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: Colors.white),
              onPressed: () {
                setState(() {
                  if (_selectedMonth == 12) {
                    _selectedMonth = 1;
                    _selectedYear++;
                  } else {
                    _selectedMonth++;
                  }
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryChip(BuildContext context, EventCategory? category, String label) {
    final isSelected = _selectedCategory == category;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = selected ? category : null;
        });
      },
      labelStyle: TextStyle(
        fontSize: 12.sp,
        color: isSelected ? Colors.white : Colors.grey.shade700,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      backgroundColor: Colors.grey.shade200,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
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

    final categoryName = _getCategoryName(context, event.category);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              // Date Box
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: event.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: event.color.withValues(alpha: 0.3),
                    width: 1.5.w,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        '${event.date.day}',
                        style: AppTextStyles.eventDateDay(event.color),
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Flexible(
                      child: Text(
                        _getMonthName(context, event.date.month).substring(0, 3),
                        style: AppTextStyles.eventDateMonth(event.color),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              // Event Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventName,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                      decoration: BoxDecoration(
                        color: event.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: event.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

}

