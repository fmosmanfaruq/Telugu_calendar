import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('te'),
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Telugu Calendar',
      'goodMorning': 'Good Morning!',
      'teluguCalendar': 'Telugu Calendar',
      'calendar': 'Calendar',
      'holidays': 'Holidays',
      'festivals': 'Festivals',
      'todayPanchang': "Today's Panchang",
      'sunrise': 'Sun Rise',
      'sunset': 'Sun Set',
      'moonrise': 'Moonrise',
      'moonset': 'Moonset',
      'panchangamDetails': 'Panchangam Details',
      'tithi': 'Tithi',
      'nakshatram': 'Nakshatram',
      'arambham': 'Arambham',
      'samapti': 'Samapti',
      'auspiciousTimings': 'Auspicious Timings',
      'rahukalam': 'Rahukalam',
      'yamagandam': 'Yamagandam',
      'varjyam': 'Varjyam',
      'durmuhurtam': 'Durmuhurtam',
      'monday': 'Monday',
      'tuesday': 'Tuesday',
      'wednesday': 'Wednesday',
      'thursday': 'Thursday',
      'friday': 'Friday',
      'saturday': 'Saturday',
      'sunday': 'Sunday',
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'august': 'August',
      'september': 'September',
      'october': 'October',
      'november': 'November',
      'december': 'December',
      'home': 'Home',
      'calendarPage': 'Calendar',
      'festivalsPage': 'Festivals',
      'horoscopePage': 'Horoscope',
      // Calendar Section
      'selectDate': 'Select Date',
      'today': 'Today',
      'previousMonth': 'Previous Month',
      'nextMonth': 'Next Month',
      'teluguDate': 'Telugu Date',
      'gregorianDate': 'Gregorian Date',
      'selectedDateDetails': 'Selected Date Details',
      // Festivals Section
      'festivalsAndHolidays': 'Festivals & Holidays',
      'allCategories': 'All',
      'nationalHolidays': 'Government Holidays',
      'religiousFestivals': 'Hindu Festivals',
      'regionalFestivals': 'Islamic Festivals',
      'christianFestivals': 'Christian Festivals',
      'selectMonth': 'Select Month',
      'selectYear': 'Select Year',
      'noEventsFound': 'No festival found',
      'republicDay': 'Republic Day',
      'independenceDay': 'Independence Day',
      'gandhiJayanti': 'Gandhi Jayanti',
      'ugadi': 'Ugadi',
      'sriRamaNavami': 'Sri Rama Navami',
      'vinayakaChaturthi': 'Vinayaka Chaturthi',
      'dussehra': 'Dussehra',
      'diwali': 'Diwali',
      'christmas': 'Christmas',
      'makaraSankranti': 'Makara Sankranti',
      'mahashivaratri': 'Maha Shivaratri',
      'holi': 'Holi',
      'publicHoliday': 'Public Holiday',
      // Horoscope Section
      'rasipalalu': 'Rasipalalu',
      'horoscope': 'Horoscope',
      'dailyHoroscope': 'Daily Horoscope',
      'weeklyHoroscope': 'Weekly Horoscope',
      'monthlyHoroscope': 'Monthly Horoscope',
      'selectYourRasi': 'Select Your Rasi',
      'luckyColor': 'Lucky Color',
      'luckyNumber': 'Lucky Number',
      'luckyTime': 'Lucky Time',
      'health': 'Health',
      'wealth': 'Wealth',
      'relationship': 'Relationship',
      'career': 'Career',
      'compatibility': 'Compatibility',
      // Zodiac Signs
      'mesha': 'Aries',
      'vrishabha': 'Taurus',
      'mithuna': 'Gemini',
      'karkataka': 'Cancer',
      'simha': 'Leo',
      'kanya': 'Virgo',
      'tula': 'Libra',
      'vrischika': 'Scorpio',
      'dhanus': 'Sagittarius',
      'makara': 'Capricorn',
      'kumbha': 'Aquarius',
      'meena': 'Pisces',
    },
    'te': {
      'appTitle': 'తెలుగు క్యాలెండర్',
      'goodMorning': 'శుభోదయం!',
      'teluguCalendar': 'తెలుగు క్యాలెండర్',
      'calendar': 'క్యాలెండర్',
      'holidays': 'సెలవులు',
      'festivals': 'పండుగలు',
      'todayPanchang': 'నేటి పంచాంగం',
      'sunrise': 'సూర్యోదయం',
      'sunset': 'సూర్యాస్తమయం',
      'moonrise': 'చంద్రోదయం',
      'moonset': 'చంద్రాస్తమయం',
      'panchangamDetails': 'పంచాంగ వివరాలు',
      'tithi': 'తిథి',
      'nakshatram': 'నక్షత్రం',
      'arambham': 'ఆరంభం',
      'samapti': 'సమాప్తి',
      'auspiciousTimings': 'శుభ సమయాలు',
      'rahukalam': 'రాహుకాలం',
      'yamagandam': 'యమగండం',
      'varjyam': 'వర్జ్యం',
      'durmuhurtam': 'దుర్ముహూర్తం',
      'monday': 'సోమవారం',
      'tuesday': 'మంగళవారం',
      'wednesday': 'బుధవారం',
      'thursday': 'గురువారం',
      'friday': 'శుక్రవారం',
      'saturday': 'శనివారం',
      'sunday': 'ఆదివారం',
      'january': 'జనవరి',
      'february': 'ఫిబ్రవరి',
      'march': 'మార్చి',
      'april': 'ఏప్రిల్',
      'may': 'మే',
      'june': 'జూన్',
      'july': 'జూలై',
      'august': 'ఆగస్టు',
      'september': 'సెప్టెంబర్',
      'october': 'అక్టోబర్',
      'november': 'నవంబర్',
      'december': 'డిసెంబర్',
      'home': 'హోమ్',
      'calendarPage': 'క్యాలెండర్',
      'festivalsPage': 'పండుగలు',
      'horoscopePage': 'రాశి ఫలాలు',
      // Calendar Section
      'selectDate': 'తేదీని ఎంచుకోండి',
      'today': 'ఈరోజు',
      'previousMonth': 'మునుపటి నెల',
      'nextMonth': 'తదుపరి నెల',
      'teluguDate': 'తెలుగు తేదీ',
      'gregorianDate': 'గ్రెగోరియన్ తేదీ',
      'selectedDateDetails': 'ఎంచుకున్న తేదీ వివరాలు',
      // Festivals Section
      'festivalsAndHolidays': 'పండుగలు & సెలవులు',
      'allCategories': 'అన్నీ',
      'nationalHolidays': 'ప్రభుత్వ సెలవులు',
      'religiousFestivals': 'హిందూ పండుగలు',
      'regionalFestivals': 'ఇస్లామిక్ పండుగలు',
      'christianFestivals': 'క్రైస్తవ పండుగలు',
      'selectMonth': 'నెలను ఎంచుకోండి',
      'selectYear': 'సంవత్సరాన్ని ఎంచుకోండి',
      'noEventsFound': 'పండుగ దొరకలేదు',
      'republicDay': 'గణతంత్ర దినోత్సవం',
      'independenceDay': 'స్వాతంత్ర్య దినోత్సవం',
      'gandhiJayanti': 'గాంధీ జయంతి',
      'ugadi': 'ఉగాది',
      'sriRamaNavami': 'శ్రీ రామ నవమి',
      'vinayakaChaturthi': 'వినాయక చవితి',
      'dussehra': 'దసరా',
      'diwali': 'దీపావళి',
      'christmas': 'క్రిస్మస్',
      'makaraSankranti': 'మకర సంక్రాంతి',
      'mahashivaratri': 'మహా శివరాత్రి',
      'holi': 'హోలీ',
      'publicHoliday': 'ప్రభుత్వ సెలవు',
      // Horoscope Section
      'rasipalalu': 'రాశిఫలాలు',
      'horoscope': 'జాతకం',
      'dailyHoroscope': 'రోజువారీ రాశిఫలం',
      'weeklyHoroscope': 'వారపు రాశిఫలం',
      'monthlyHoroscope': 'నెలవారీ రాశిఫలం',
      'selectYourRasi': 'మీ రాశిని ఎంచుకోండి',
      'luckyColor': 'అదృష్ట రంగు',
      'luckyNumber': 'అదృష్ట సంఖ్య',
      'luckyTime': 'అదృష్ట సమయం',
      'health': 'ఆరోగ్యం',
      'wealth': 'ధనం',
      'relationship': 'సంబంధాలు',
      'career': 'వృత్తి',
      'compatibility': 'అనుకూలత',
      // Zodiac Signs
      'mesha': 'మేషం',
      'vrishabha': 'వృషభం',
      'mithuna': 'మిథునం',
      'karkataka': 'కర్కాటకం',
      'simha': 'సింహం',
      'kanya': 'కన్య',
      'tula': 'తుల',
      'vrischika': 'వృశ్చికం',
      'dhanus': 'ధనుస్సు',
      'makara': 'మకరం',
      'kumbha': 'కుంభం',
      'meena': 'మీనం',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]!['appTitle']!;
  String get goodMorning =>
      _localizedValues[locale.languageCode]!['goodMorning']!;
  String get teluguCalendar =>
      _localizedValues[locale.languageCode]!['teluguCalendar']!;
  String get calendar => _localizedValues[locale.languageCode]!['calendar']!;
  String get holidays => _localizedValues[locale.languageCode]!['holidays']!;
  String get festivals => _localizedValues[locale.languageCode]!['festivals']!;
  String get todayPanchang =>
      _localizedValues[locale.languageCode]!['todayPanchang']!;
  String get sunrise => _localizedValues[locale.languageCode]!['sunrise']!;
  String get sunset => _localizedValues[locale.languageCode]!['sunset']!;
  String get moonrise => _localizedValues[locale.languageCode]!['moonrise']!;
  String get moonset => _localizedValues[locale.languageCode]!['moonset']!;
  String get panchangamDetails =>
      _localizedValues[locale.languageCode]!['panchangamDetails']!;
  String get tithi => _localizedValues[locale.languageCode]!['tithi']!;
  String get nakshatram =>
      _localizedValues[locale.languageCode]!['nakshatram']!;
  String get arambham => _localizedValues[locale.languageCode]!['arambham']!;
  String get samapti => _localizedValues[locale.languageCode]!['samapti']!;
  String get auspiciousTimings =>
      _localizedValues[locale.languageCode]!['auspiciousTimings']!;
  String get rahukalam => _localizedValues[locale.languageCode]!['rahukalam']!;
  String get yamagandam =>
      _localizedValues[locale.languageCode]!['yamagandam']!;
  String get varjyam => _localizedValues[locale.languageCode]!['varjyam']!;
  String get durmuhurtam =>
      _localizedValues[locale.languageCode]!['durmuhurtam']!;
  String get monday => _localizedValues[locale.languageCode]!['monday']!;
  String get tuesday => _localizedValues[locale.languageCode]!['tuesday']!;
  String get wednesday => _localizedValues[locale.languageCode]!['wednesday']!;
  String get thursday => _localizedValues[locale.languageCode]!['thursday']!;
  String get friday => _localizedValues[locale.languageCode]!['friday']!;
  String get saturday => _localizedValues[locale.languageCode]!['saturday']!;
  String get sunday => _localizedValues[locale.languageCode]!['sunday']!;
  String get january => _localizedValues[locale.languageCode]!['january']!;
  String get february => _localizedValues[locale.languageCode]!['february']!;
  String get march => _localizedValues[locale.languageCode]!['march']!;
  String get april => _localizedValues[locale.languageCode]!['april']!;
  String get may => _localizedValues[locale.languageCode]!['may']!;
  String get june => _localizedValues[locale.languageCode]!['june']!;
  String get july => _localizedValues[locale.languageCode]!['july']!;
  String get august => _localizedValues[locale.languageCode]!['august']!;
  String get september => _localizedValues[locale.languageCode]!['september']!;
  String get october => _localizedValues[locale.languageCode]!['october']!;
  String get november => _localizedValues[locale.languageCode]!['november']!;
  String get december => _localizedValues[locale.languageCode]!['december']!;
  String get home => _localizedValues[locale.languageCode]!['home']!;
  String get horoscope => _localizedValues[locale.languageCode]!['horoscope']!;
  String get calendarPage =>
      _localizedValues[locale.languageCode]!['calendarPage']!;
  String get festivalsPage =>
      _localizedValues[locale.languageCode]!['festivalsPage']!;
  String get horoscopePage =>
      _localizedValues[locale.languageCode]!['horoscopePage']!;

  // Calendar Section
  String get selectDate =>
      _localizedValues[locale.languageCode]!['selectDate']!;
  String get today => _localizedValues[locale.languageCode]!['today']!;
  String get previousMonth =>
      _localizedValues[locale.languageCode]!['previousMonth']!;
  String get nextMonth => _localizedValues[locale.languageCode]!['nextMonth']!;
  String get teluguDate =>
      _localizedValues[locale.languageCode]!['teluguDate']!;
  String get gregorianDate =>
      _localizedValues[locale.languageCode]!['gregorianDate']!;
  String get selectedDateDetails =>
      _localizedValues[locale.languageCode]!['selectedDateDetails']!;

  // Festivals Section
  String get festivalsAndHolidays =>
      _localizedValues[locale.languageCode]!['festivalsAndHolidays']!;
  String get allCategories =>
      _localizedValues[locale.languageCode]!['allCategories']!;
  String get nationalHolidays =>
      _localizedValues[locale.languageCode]!['nationalHolidays']!;
  String get christianFestivals =>
      _localizedValues[locale.languageCode]!['christianFestivals']!;
  String get religiousFestivals =>
      _localizedValues[locale.languageCode]!['religiousFestivals']!;
  String get regionalFestivals =>
      _localizedValues[locale.languageCode]!['regionalFestivals']!;
  String get selectMonth =>
      _localizedValues[locale.languageCode]!['selectMonth']!;
  String get selectYear =>
      _localizedValues[locale.languageCode]!['selectYear']!;
  String get noEventsFound =>
      _localizedValues[locale.languageCode]!['noEventsFound']!;
  String get republicDay =>
      _localizedValues[locale.languageCode]!['republicDay']!;
  String get independenceDay =>
      _localizedValues[locale.languageCode]!['independenceDay']!;
  String get gandhiJayanti =>
      _localizedValues[locale.languageCode]!['gandhiJayanti']!;
  String get ugadi => _localizedValues[locale.languageCode]!['ugadi']!;
  String get sriRamaNavami =>
      _localizedValues[locale.languageCode]!['sriRamaNavami']!;
  String get vinayakaChaturthi =>
      _localizedValues[locale.languageCode]!['vinayakaChaturthi']!;
  String get dussehra => _localizedValues[locale.languageCode]!['dussehra']!;
  String get diwali => _localizedValues[locale.languageCode]!['diwali']!;
  String get christmas => _localizedValues[locale.languageCode]!['christmas']!;
  String get makaraSankranti =>
      _localizedValues[locale.languageCode]!['makaraSankranti']!;
  String get mahashivaratri =>
      _localizedValues[locale.languageCode]!['mahashivaratri']!;
  String get holi => _localizedValues[locale.languageCode]!['holi']!;
  String get publicHoliday =>
      _localizedValues[locale.languageCode]!['publicHoliday']!;

  // Horoscope Section
  String get rasipalalu =>
      _localizedValues[locale.languageCode]!['rasipalalu']!;
  String get dailyHoroscope =>
      _localizedValues[locale.languageCode]!['dailyHoroscope']!;
  String get weeklyHoroscope =>
      _localizedValues[locale.languageCode]!['weeklyHoroscope']!;
  String get monthlyHoroscope =>
      _localizedValues[locale.languageCode]!['monthlyHoroscope']!;
  String get selectYourRasi =>
      _localizedValues[locale.languageCode]!['selectYourRasi']!;
  String get luckyColor =>
      _localizedValues[locale.languageCode]!['luckyColor']!;
  String get luckyNumber =>
      _localizedValues[locale.languageCode]!['luckyNumber']!;
  String get luckyTime => _localizedValues[locale.languageCode]!['luckyTime']!;
  String get health => _localizedValues[locale.languageCode]!['health']!;
  String get wealth => _localizedValues[locale.languageCode]!['wealth']!;
  String get relationship =>
      _localizedValues[locale.languageCode]!['relationship']!;
  String get career => _localizedValues[locale.languageCode]!['career']!;
  String get compatibility =>
      _localizedValues[locale.languageCode]!['compatibility']!;

  // Zodiac Signs
  String get mesha => _localizedValues[locale.languageCode]!['mesha']!;
  String get vrishabha => _localizedValues[locale.languageCode]!['vrishabha']!;
  String get mithuna => _localizedValues[locale.languageCode]!['mithuna']!;
  String get karkataka => _localizedValues[locale.languageCode]!['karkataka']!;
  String get simha => _localizedValues[locale.languageCode]!['simha']!;
  String get kanya => _localizedValues[locale.languageCode]!['kanya']!;
  String get tula => _localizedValues[locale.languageCode]!['tula']!;
  String get vrischika => _localizedValues[locale.languageCode]!['vrischika']!;
  String get dhanus => _localizedValues[locale.languageCode]!['dhanus']!;
  String get makara => _localizedValues[locale.languageCode]!['makara']!;
  String get kumbha => _localizedValues[locale.languageCode]!['kumbha']!;
  String get meena => _localizedValues[locale.languageCode]!['meena']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'te'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
