import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('it')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'TwelveNotes'**
  String get appName;

  /// No description provided for @titleLogin.
  ///
  /// In en, this message translates to:
  /// **'Ready to play!!!🎸'**
  String get titleLogin;

  /// No description provided for @ctaLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get ctaLogin;

  /// No description provided for @signUpText.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t signed up yet?'**
  String get signUpText;

  /// No description provided for @signUpCta.
  ///
  /// In en, this message translates to:
  /// **'SignUp!!!🚀'**
  String get signUpCta;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm email'**
  String get emailConfirmLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordConfirmLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get passwordConfirmLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @surnameLabel.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surnameLabel;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @resetPswMessage.
  ///
  /// In en, this message translates to:
  /// **'You cannot to access?'**
  String get resetPswMessage;

  /// No description provided for @resetPswCta.
  ///
  /// In en, this message translates to:
  /// **'Reset password🔄'**
  String get resetPswCta;

  /// No description provided for @welcomeMessage1.
  ///
  /// In en, this message translates to:
  /// **'Play the music you love.'**
  String get welcomeMessage1;

  /// No description provided for @welcomeMessage2.
  ///
  /// In en, this message translates to:
  /// **'Wherever you are.'**
  String get welcomeMessage2;

  /// No description provided for @welcomeMessage3.
  ///
  /// In en, this message translates to:
  /// **'Share it with whomever you want.'**
  String get welcomeMessage3;

  /// No description provided for @welcomeMessage4.
  ///
  /// In en, this message translates to:
  /// **'Have fun.'**
  String get welcomeMessage4;

  /// No description provided for @welcomeCta.
  ///
  /// In en, this message translates to:
  /// **'Start now'**
  String get welcomeCta;

  /// No description provided for @closeCta.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeCta;

  /// No description provided for @loginGenericError.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred. Please try logging in again.'**
  String get loginGenericError;

  /// No description provided for @loginWrongCredentials.
  ///
  /// In en, this message translates to:
  /// **'The credentials don\'t seem to be correct. Please try again.'**
  String get loginWrongCredentials;

  /// No description provided for @loginAccountNotExsist.
  ///
  /// In en, this message translates to:
  /// **'The account you\'re trying to log in with does not exist. Please register before.'**
  String get loginAccountNotExsist;

  /// No description provided for @titleRegister.
  ///
  /// In en, this message translates to:
  /// **'SignUp!!!'**
  String get titleRegister;

  /// No description provided for @registerErrorEmailMatch.
  ///
  /// In en, this message translates to:
  /// **'The email and confirm email fields must match.'**
  String get registerErrorEmailMatch;

  /// No description provided for @registerErrorPasswordMatch.
  ///
  /// In en, this message translates to:
  /// **'The password and confirm password fields must match.'**
  String get registerErrorPasswordMatch;

  /// No description provided for @ctaSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get ctaSignUp;

  /// No description provided for @resetPswModalMessage.
  ///
  /// In en, this message translates to:
  /// **'We will send a message to the following email address:'**
  String get resetPswModalMessage;

  /// No description provided for @resetPswModalCta.
  ///
  /// In en, this message translates to:
  /// **'Send email'**
  String get resetPswModalCta;

  /// No description provided for @errorWrongPassword.
  ///
  /// In en, this message translates to:
  /// **'The password must contain: 1 uppercase letter, 1 lowercase letter, 1 symbol, 1 number, and be at least 8 characters long.'**
  String get errorWrongPassword;

  /// No description provided for @errorAlreadyExsist.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered. Please try another one.'**
  String get errorAlreadyExsist;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred. Please try again.'**
  String get errorGeneric;

  /// No description provided for @confirmSignUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up Confirmed!'**
  String get confirmSignUpTitle;

  /// No description provided for @errorSignUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign up Error!'**
  String get errorSignUpTitle;

  /// No description provided for @confirmSignUpMessage.
  ///
  /// In en, this message translates to:
  /// **'Check your email to {email} confirm your registration.'**
  String confirmSignUpMessage(String email);

  /// No description provided for @errorSignUpMessage.
  ///
  /// In en, this message translates to:
  /// **'There was an error during registration. Please start again.'**
  String get errorSignUpMessage;

  /// No description provided for @startAgainButton.
  ///
  /// In en, this message translates to:
  /// **'Start again'**
  String get startAgainButton;

  /// No description provided for @confirmCta.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmCta;

  /// No description provided for @newPswTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get newPswTitle;

  /// No description provided for @homeTitlePage.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeTitlePage;

  /// No description provided for @libraryTitlePage.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get libraryTitlePage;

  /// No description provided for @searchTitlePage.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTitlePage;

  /// No description provided for @settingsTitlePage.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitlePage;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search artists and songs...'**
  String get searchHint;

  /// No description provided for @searchSectionArtists.
  ///
  /// In en, this message translates to:
  /// **'Artists'**
  String get searchSectionArtists;

  /// No description provided for @searchSectionSongs.
  ///
  /// In en, this message translates to:
  /// **'Songs'**
  String get searchSectionSongs;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get searchNoResults;
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
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
