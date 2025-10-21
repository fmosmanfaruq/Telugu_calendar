import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('te')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Telugu Calendar'**
  String get appTitle;

  /// Morning greeting
  ///
  /// In en, this message translates to:
  /// **'Good Morning!'**
  String get goodMorning;

  /// App name in header
  ///
  /// In en, this message translates to:
  /// **'Telugu Calendar'**
  String get teluguCalendar;

  /// Calendar quick link
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// Holidays quick link
  ///
  /// In en, this message translates to:
  /// **'Holidays'**
  String get holidays;

  /// Festivals quick link
  ///
  /// In en, this message translates to:
  /// **'Festivals'**
  String get festivals;

  /// Horoscope quick link
  ///
  /// In en, this message translates to:
  /// **'Rasipalalu'**
  String get rasipalalu;

  /// Today's Panchang section title
  ///
  /// In en, this message translates to:
  /// **'Today\'s Panchang'**
  String get todayPanchang;

  /// Sunrise label
  ///
  /// In en, this message translates to:
  /// **'Sun Rise'**
  String get sunrise;

  /// Sunset label
  ///
  /// In en, this message translates to:
  /// **'Sun Set'**
  String get sunset;

  /// Moonrise label
  ///
  /// In en, this message translates to:
  /// **'Moonrise'**
  String get moonrise;

  /// Moonset label
  ///
  /// In en, this message translates to:
  /// **'Moonset'**
  String get moonset;

  /// Panchangam details section title
  ///
  /// In en, this message translates to:
  /// **'Panchangam Details'**
  String get panchangamDetails;

  /// Tithi label
  ///
  /// In en, this message translates to:
  /// **'Tithi'**
  String get tithi;

  /// Nakshatram label
  ///
  /// In en, this message translates to:
  /// **'Nakshatram'**
  String get nakshatram;

  /// Start time label
  ///
  /// In en, this message translates to:
  /// **'Arambham'**
  String get arambham;

  /// End time label
  ///
  /// In en, this message translates to:
  /// **'Samapti'**
  String get samapti;

  /// Auspicious timings section title
  ///
  /// In en, this message translates to:
  /// **'Auspicious Timings'**
  String get auspiciousTimings;

  /// Rahukalam timing
  ///
  /// In en, this message translates to:
  /// **'Rahukalam'**
  String get rahukalam;

  /// Yamagandam timing
  ///
  /// In en, this message translates to:
  /// **'Yamagandam'**
  String get yamagandam;

  /// Varjyam timing
  ///
  /// In en, this message translates to:
  /// **'Varjyam'**
  String get varjyam;

  /// Durmuhurtam timing
  ///
  /// In en, this message translates to:
  /// **'Durmuhurtam'**
  String get durmuhurtam;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @calendarPage.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendarPage;

  /// No description provided for @festivalsPage.
  ///
  /// In en, this message translates to:
  /// **'Festivals'**
  String get festivalsPage;

  /// No description provided for @horoscopePage.
  ///
  /// In en, this message translates to:
  /// **'Horoscope'**
  String get horoscopePage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'te'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
